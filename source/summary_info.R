#summary_info.R
ss_df <- read.csv(file = "C:\\Users\\simra\\OneDrive\\Documents\\INFO201\\project-group-6-section-ae\\data\\School Shootings Dataset - INFO 201\\pah_wikp_combo.csv")

# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()

summary_info$num_observations <- nrow(ss_df)

summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)

area_stats <- ss_df %>%
  group_by(AreaType) %>%
  count() %>%
  filter(n == max(n)) %>%
  pull(AreaType)

type_of_school <- ss_df %>%
  group_by(School) %>%
  count() %>%
  filter(n == max(n)) %>%
  pull(School)


