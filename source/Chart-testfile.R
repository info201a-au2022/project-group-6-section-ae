library(dplyr)
library(tidyverse)
library(ggplot2)

install.packages("hrbrthemes")
library(hrbrthemes)


library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2")

ss_df <- read.csv(file = "C:\\Users\\simra\\OneDrive\\Documents\\INFO201\\project-group-6-section-ae\\data\\School Shootings Dataset - INFO 201\\pah_wikp_combo.csv")

# basic histogram

total_c_shootings <- ss_df %>%
  filter(School == "C")

num_c_shootings <- nrow(total_c_shootings)

total_hs_shootings <- ss_df %>%
  filter(School == "HS")

num_hs_shootings <- nrow(total_hs_shootings)

total_ms_shootings <- ss_df %>%
  filter(School == "MS")

num_ms_shootings <- nrow(total_ms_shootings)

total_es_shootings <- ss_df %>%
  filter(School == "ES")

num_es_shootings <- nrow(total_es_shootings)

vec_total_shootings <- c(num_c_shootings, num_hs_shootings, num_ms_shootings, num_es_shootings)

vec_school_type <-c("C", "HS", "MS", "ES")

testing_data <- group_by(ss_df, School)

count_type <- ss_df %>%
  group_by(School) %>%
  count()

#Table grouping by one feature - State
state_table <- ss_df %>%
  group_by(State) %>%
  count(name = "Number of Shootings") %>%
  


# Barplot
    
    #NEW
ggplot(ss_df, aes(fill=AreaType, y=num_es_shootings, x=ss_df$School)) + 
  geom_bar(position="dodge", stat="identity")

  #DIFFERENT
ggplot(ss_df, aes(x=ss_df$School, y=num_es_shootings)) + 
  geom_bar(stat = "identity")

#OLD
total_shootings <- ss_df %>%
  filter(School == "HS")

hs_shootings <- nrow(total_shootings)

ggplot(ss_df, aes(x=ss_df$School, y=nrow(hs_shootings))) + 
  geom_bar(stat = "identity")

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
  


pie(vec_areatype , labels = c("Urban","Suburban","Rural"), border="black", col=myPalette, main = "Shootings Based On Area" )


#LinePlot

deaths_plot <- ggplot(data = ss_df) + 
  geom_line(mapping = aes(x = as.Date(Date), y = Sum(Fatalities))) +
  labs(x = "Date", y = "Cumilative fatalities", title = "Fatalities due to School Shootings")
deaths_plot