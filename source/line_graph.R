library(dplyr)
library(tidyverse)
library(ggplot2)
library(scales)
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2")

ss_df <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-6-section-ae/main/data/School%20Shootings%20Dataset%20-%20INFO%20201/pah_wikp_combo.csv")


ss_df$years <- format(as.Date(ss_df$Date, format = "%m/%d/%Y"), "%Y")
ss_df$years


#lineplot
# Libraries

library(ggplot2)
library(hrbrthemes)
library(lubridate)

# create data
year_table <- ss_df %>%
  group_by(years) %>%
  summarize(sum(Fatalities))


xValue <- unique(ss_df$years)
yValue <- (year_table[[2]])
deathtable <- data.frame(xValue,yValue)


# Plot
fatalitiygraph <- ggplot(deathtable, aes(x=xValue, y=yValue))+
  
  geom_line(color="#FF0000", size=1, alpha=0.9, linetype=2, group = 1) +
  theme_ipsum() +
  ggtitle("Fatalities due to School Shootings") + xlab("Year") + ylab("Ammount of Fatalities")+
  scale_x_discrete(breaks = deathtable$xValue[seq(1, length(deathtable$xValue), by=5)])

fatalitiygraph




