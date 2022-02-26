library(metadat)
library(shiny)
library(tidyverse)
library(DT)

db <- tools:::Rd_db("metadat")
# remove non data Rd
db$datsearch.Rd <- NULL
db$`metadat-package.Rd` <- NULL
db$prep_dat.Rd <- NULL
# metadata per Rd file
name  <- lapply(db, tools:::.Rd_get_metadata, "name")
title <- lapply(db, tools:::.Rd_get_metadata, "title")
description  <- lapply(db, tools:::.Rd_get_metadata, "description")
# remove the mathjaxr loading stuff from the descriptions
description  <- lapply(description, function(x) strsplit(x, "\n\\if{html}", fixed=TRUE)[[1]][1])
concepts.raw <- lapply(db, tools:::.Rd_get_metadata, "concept")
fields   <- c("alternative medicine", "attraction", "cardiology", "climate change", "covid-19", "criminology", "dentistry", "ecology", "education", "engineering", "epidemiology", "evolution", "human factors", "medicine", "memory", "obstetrics", "oncology", "persuasion", "primary care", "psychiatry", "psychology", "smoking", "social work", "sociology")
measures <- c("correlation coefficients", "Cronbach's alpha", "hazard ratios", "incidence rates", "raw mean differences", "odds ratios", "proportions", "ratios of means", "raw means", "risk differences", "risk ratios", "(semi-)partial correlations", "standardized mean changes", "standardized mean differences")
methods  <- c("cluster-robust inference", "component network meta-analysis", "cumulative meta-analysis", "diagnostic accuracy studies", "dose response models", "generalized linear models", "longitudinal models", "Mantel-Haenszel method", "meta-regression", "model checks", "multilevel models", "multivariate models", "network meta-analysis", "outliers", "Peto's method", "phylogeny", "publication bias", "reliability generalization", "single-arm studies", "spatial correlation")
fields   <- sapply(concepts.raw, function(x) paste0(fields[fields %in% x], collapse=", "))
measures <- sapply(concepts.raw, function(x) paste0(measures[measures %in% x], collapse=", "))
methods  <- sapply(concepts.raw, function(x) paste0(methods[methods %in% x], collapse=", "))
dataExtracted <- as.data.frame(cbind(name, title, description, fields, measures, methods))
df <- dataExtracted
df$name <- paste0(
  "<a href='",
  "https://wviechtb.github.io/metadat/reference/",
  name,
  ".html",
  "'>",
  name,
  "</a>"
)
df2=df %>% separate_rows(fields,sep="," )
df3=df2%>% separate_rows(measures,sep="," )
df4=df3%>% separate_rows(methods,sep="," )
names(df4)
my_autocomplete_list1 <-  unique(df4$name)
my_autocomplete_list2 <- unlist(unique(df4$title))
my_autocomplete_list3 <-  unique(df4$fields)
my_autocomplete_list4 <-  unique(df4$measures)
my_autocomplete_list5 <-  unique(df4$methods)
ui <- shinyUI(
  fluidPage(
        sidebarPanel(
          selectInput("searchType", "What do you want to search",
                      c(Title = "title", Methods = "methods")
          ),
          # Only show this panel if the plot type is a histogram
          conditionalPanel(
            condition = "input.searchType == 'title'",
            selectizeInput(
              inputId = 'searchTitle',
              label = 'Search the title',
              choices = my_autocomplete_list2,
              selected = NULL,
              multiple = TRUE, # allow for multiple inputs
              options = list(create = FALSE) # if TRUE, allows newly created inputs
            )),
            # Only show this panel if Custom is selected
            conditionalPanel(
              condition = "input.searchType == 'methods'",
              selectizeInput(
                inputId = 'searchMethods',
                label = 'Search the methods',
                choices = my_autocomplete_list5,
                selected = NULL,
                multiple = TRUE, # allow for multiple inputs
                options = list(create = FALSE) # if TRUE, allows newly created inputs
              )
          )
        ),
        mainPanel(
             DTOutput("table")
    )
  )


)
server <- function(input, output, session) {
  tab=reactive({
    if (input$searchType == "methods") {
      df4 %>%
        filter(methods==input$searchMethods)
    } else {
    df4 %>%
      filter(title==input$searchTitle)
  }
    })

  output$table=renderDT(
    df[df$name%in% tab()$name,], escape=FALSE)
}

shinyApp(ui = ui, server = server)
