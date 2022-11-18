#PieChart
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2")

ss_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-ae/main/data/School%20Shootings%20Dataset%20-%20INFO%20201/pah_wikp_combo.csv")

urban <- ss_df %>%
  filter(AreaType == "urban")

suburban <- ss_df %>%
  filter(AreaType == "suburban")

rural <- ss_df %>%
  filter(AreaType == "rural")

num_urban = nrow(urban)

num_rural = nrow(rural)
?nrow()

num_suburban = nrow(suburban)

vec_areatype <- c(num_urban, num_suburban, num_rural)

pie_chart <- function() {
  pie(vec_areatype , labels = c("Urban","Suburban","Rural"),  main = "Shootings Based On Area",  border="black", col=myPalette)
}
pie_chart()