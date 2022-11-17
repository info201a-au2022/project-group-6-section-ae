library(dplyr)
library(tidyverse)
library(ggplot2)

install.packages("hrbrthemes")
library(hrbrthemes)


library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2")

ss_df <- read.csv(file = "C:\\Users\\simra\\OneDrive\\Documents\\INFO201\\project-group-6-section-ae\\data\\School Shootings Dataset - INFO 201\\pah_wikp_combo.csv")

#Table grouping by one feature - State
state_table <- ss_df %>%
  group_by(State) %>%
  count(name = "Number of Shootings")
  
# Barplot
    
shooting_count_table <- ss_df %>%
  group_by(School) %>%
  count(name = "Number_of_Shootings") %>%
  filter(School != "")

  shooting_count_table$School <- recode(shooting_count_table$School, "-" = "Unknown Type")

#Shooting_Table Bar Graph

ggplot(shooting_count_table, aes(x=School, y=Number_of_Shootings)) + 
  geom_bar(stat = "identity", color="black", fill = "red") +
  labs(x = "School", y = "Number of Shootings", title = "Shootings Based on School Type")

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
  
pie(vec_areatype , labels = c("Urban","Suburban","Rural"),  main = "Shootings Based On Area",  border="black", col=myPalette)


#LinePlot

#Redo format properly for date
#Group by function for new tbale of just years and fatalities

deaths_plot <- ggplot(data = ss_df) + 
  geom_line(mapping = aes(x = as.Date(Date), y = Sum(Fatalities))) +
  labs(x = "Date", y = "Cumilative fatalities", title = "Fatalities due to School Shootings")
deaths_plot