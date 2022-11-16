library(dplyr)
library(tidyverse)
library(ggplot2)

library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2")

ss_df <- read.csv(file = "C:\\Users\\simra\\OneDrive\\Documents\\INFO201\\project-group-6-section-ae\\data\\School Shootings Dataset - INFO 201\\pah_wikp_combo.csv")


data = ss_df

# basic histogram

total_shootings <- ss_df %>%
  filter(School == "HS")

hs_shootings <- nrow(total_shootings)

# Barplot
bar_plot <- ggplot(data, aes(x = ss_df$School, y=nrow(hs_shootings)) +
  geom_bar(stat = "identity")
  
bar_plot

  
ggplot(data, aes(x=nrow(hs_shootings), y=ss_df$School) + 
    geom_bar(stat = "identity") +
    coord_flip()
 
#PieChart
  urban <- ss_df %>%
    filter(AreaType == "urban")
  
  suburban <- ss_df %>%
    filter(AreaType == "suburban")
  
  rural <- ss_df %>%
    filter(AreaType == "rural")
  
  num_urban = nrow(urban)
  
  num_rural = nrow(rural)
  
  num_suburban = nrow(suburban)
 
  vec_areatype <- c(num_urban, num_suburban, num_rural)
  
pie(vec_areatype)

pie(vec_areatype , labels = c("Urban","Suburban","Rural"), border="white", col=myPalette )

#LinePlot

deaths_plot <- ggplot(data = ss_df) + 
  geom_line(mapping = aes(x = as.Date(Date), y = Sum(Fatalities))) +
  labs(x = "Date", y = "Cumilative fatalities", title = "Fatalities due to School Shootings")
deaths_plot