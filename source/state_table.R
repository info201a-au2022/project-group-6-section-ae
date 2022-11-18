library(dplyr)
library(tidyverse)

ss_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-ae/main/data/School%20Shootings%20Dataset%20-%20INFO%20201/pah_wikp_combo.csv")


#Table for shootings in each state 

state_table <- ss_df %>%
	group_by(State) %>%
	count(name = "Number of Shootings")