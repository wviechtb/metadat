library(metadat)
library(shiny)
library(DT)

ui <- shinyUI(navbarPage(
   title = 'metadat: Database',
   tabPanel("Summary", icon = icon("table", lib = "font-awesome"), DT::dataTableOutput('tableOutput'))
))

server <- shinyServer(function(input, output, session) {

   db <- tools:::Rd_db("metadat")

   # keep only elements that start with dat. (i.e., the datasets)
   db <- db[grep("^dat[.]", names(db))]

   # metadata per Rd file
   name <- lapply(db, tools:::.Rd_get_metadata, "name")
   title <- lapply(db, tools:::.Rd_get_metadata, "title")
   description <- lapply(db, tools:::.Rd_get_metadata, "description")

   # remove the mathjaxr loading stuff from the descriptions
   description  <- lapply(description, function(x) strsplit(x, "\n\\if{html}", fixed=TRUE)[[1]][1])
   concepts.raw <- lapply(db, tools:::.Rd_get_metadata, "concept")

   # all concept terms used so far split by fields, measures, and methods
   fields   <- c("alternative medicine", "attraction", "cardiology", "climate change", "covid-19", "criminology", "dentistry", "ecology", "education", "engineering", "epidemiology", "evolution", "human factors", "medicine", "memory", "obstetrics", "oncology", "persuasion", "primary care", "psychiatry", "psychology", "smoking", "social work", "sociology")
   measures <- c("correlation coefficients", "Cronbach's alpha", "hazard ratios", "incidence rates", "raw mean differences", "odds ratios", "proportions", "ratios of means", "raw means", "risk differences", "risk ratios", "(semi-)partial correlations", "standardized mean changes", "standardized mean differences")
   methods  <- c("cluster-robust inference", "component network meta-analysis", "cumulative meta-analysis", "diagnostic accuracy studies", "dose response models", "generalized linear models", "longitudinal models", "Mantel-Haenszel method", "meta-regression", "model checks", "multilevel models", "multivariate models", "network meta-analysis", "outliers", "Peto's method", "phylogeny", "publication bias", "reliability generalization", "single-arm studies", "spatial correlation")

   # for each dataset, collapse multiple terms (within these categories) down into a single comma-separated string
   tab.fields   <- sapply(concepts.raw, function(x) paste0(fields[fields %in% x], collapse=", "))
   tab.measures <- sapply(concepts.raw, function(x) paste0(measures[measures %in% x], collapse=", "))
   tab.methods  <- sapply(concepts.raw, function(x) paste0(methods[methods %in% x], collapse=", "))

   # create the data frame
   df <- as.data.frame(cbind(name, title, description, tab.fields, tab.measures, tab.methods))
   df$name <- paste0("<a href='https://wviechtb.github.io/metadat/reference/", name, ".html'>", name, "</a>")

   options(DT.options = list(pageLength = 15))

   # output data table
   table_export <- DT::datatable(
      df,
      escape = FALSE,
      extensions = c("SearchPanes", "Select"),
      selection = "none",
      colnames = cbind("Documentation", "Title", "Study Description", "Fields", "Measures", "Methods"),
      rownames = FALSE,
      options = list(dom = "Pfrtip",
                     columnDefs = list(
                     #list(searchPanes = list(show = FALSE), targets = 1:3),
                     list(searchPanes = list(show = FALSE), targets = c(0, 1, 2))
                     ))
   )

   output$tableOutput = DT::renderDataTable(table_export, server = FALSE)

})

shinyApp(ui = ui, server = server)
