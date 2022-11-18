library(dplyr)
library(tidyverse)
library(ggplot2)

ss_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-ae/main/data/School%20Shootings%20Dataset%20-%20INFO%20201/pah_wikp_combo.csv")

# Table of shootings counts per school type

shooting_count_table <- ss_df %>%
  group_by(School) %>%
  count(name = "Number_of_Shootings") %>%
  filter(School != "")

shooting_count_table$School <- recode(shooting_count_table$School, "-" = "Unknown Type")

#Shooting_Table Bar Graph

ggplot(shooting_count_table, aes(x=School, y=Number_of_Shootings)) + 
  geom_bar(stat = "identity", color="black", fill = "red") +
  labs(x = "School", y = "Number of Shootings", title = "Shootings Based on School Type")
