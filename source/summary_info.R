#summary_info.R
library(dplyr)
ss_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-ae/main/data/School%20Shootings%20Dataset%20-%20INFO%20201/pah_wikp_combo.csv")

# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()

# Number of incidents in the data frame
summary_info$num_observations <- nrow(ss_df)

#Area type with the most number of shootings
area_stats <- ss_df %>%
  group_by(AreaType) %>%
  count() %>%
  filter(AreaType != "") %>%
  arrange(-n) %>%
  head(1) %>%
  pull(AreaType)

summary_info$area_stats <- area_stats

#Type of school with the most number of shootings
type_of_school <- ss_df %>%
  group_by(School) %>%
  count() %>%
  filter(School != "") %>%
  filter(School != "-") %>%
  arrange(-n) %>%
  head(1) %>%
  pull(School)

summary_info$type_of_school <- type_of_school

#State with the most number of shootings
state_with_highest <- ss_df %>%
  group_by(State) %>%
  count() %>%
  arrange(-n) %>%
  head(1) %>%
  pull(State)

summary_info$state_with_highest <- state_with_highest

#Highest fatalaties in a single shooting
highest_fatalities <- ss_df %>%
  filter(Fatalities == max(Fatalities)) %>%
  pull(Fatalities)

summary_info$highest_fatalities <- highest_fatalities