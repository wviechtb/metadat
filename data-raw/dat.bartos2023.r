# Bartoš, F., Sarafoglou, A., Godmann, H. R., Sahrani, A., Leunk, D. K., Gui,
# P. Y., Voss, D., Ullah, K., Zoubek, M. J., Nippold, F., Aust, F., Vieira, F.
# F., Islam, C.-G., Zoubek, A. J., Shabani, S., Petter, J., Roos, I. B.,
# Finnemann, A., Lob, A. B., Hoffstadt, M. F., Nak, J., de Ron, J., Derks, K.,
# Huth, K., Terpstra, S., Bastelica, T., Matetovici, M., Ott, V. L., Zetea, A.
# S., Karnbach, K., Donzallaz, M. C., John, A., Moore, R. M., Assion, F., van
# Bork, R., Leidinger, T. E., Zhao, X., Motaghi, A. K., Pan, T., Armstrong,
# H., Peng, T., Bialas, M., Pang, J. Y.-C., Fu, B., Yang, S., Lin, X.,
# Sleiffer, D., Bognar, M., Aczel, B., & Wagenmakers, E.-J. (2023). Fair coins
# tend to land on the same side they started: Evidence from 350,757 flips.
# arXiv, 2310.04153, v2.

dat.bartos2023 <- read.table("data-raw/dat.bartos2023.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.bartos2023, file="data/dat.bartos2023.rda")
