
#
#
# Rename this file to server.R and make ui.R
library(dplyr)

raw_data <- read.csv("data/Boston_Police_Department_FIO.csv")

source("scripts/data_wrangling.R")
source("scripts/summary_statistics.R")

# Wrangle the raw data
df <- wrangle(raw_data)
View(df)

# Summarises data based on the variables we wanted and returns them in a list
list <- summarise_data(df)
print(list)

#__________
## OUTPUT from print(list)
#
# $total_observations
# [1] "152230"
# 
# $sex_percentages1
# [1] "88.198121263877"
# 
# $sex_percentages2
# [1] "11.6461932601984"
# 
# $sex_percentages3
# [1] "0.155685475924588"
# 
# $year_with_the_most_stops
# [1] "2012"
# 
# $stops_in_the_year_with_the_most_stops
# [1] "40497"
# 
# $age_group_percentages1
# [1] "2.51395914077383"
# 
# $age_group_percentages2
# [1] "0.213492741246798"
# 
# $age_group_percentages3
# [1] "6.64126650463115"
# 
# $age_group_percentages4
# [1] "37.0656243841556"
# 
# $age_group_percentages5
# [1] "29.2360244367076"
# 
# $age_group_percentages6
# [1] "12.7773763384353"
# 
# $age_group_percentages7
# [1] "8.62970505156671"
# 
# $age_group_percentages8
# [1] "2.45680877619392"
# 
# $age_group_percentages9
# [1] "0.359324706036918"
# 
# $age_group_percentages10
# [1] "0.10641792025225"
# 
# $age_group_stopped_the_most
# [1] "18-24"
# 
# > print(list)
# $total_observations
# [1] "152230"
# 
# $sex_percentages1
# [1] "88.198121263877"
# 
# $sex_percentages2
# [1] "11.6461932601984"
# 
# $sex_percentages3
# [1] "0.155685475924588"
# 
# $year_with_the_most_stops
# [1] "2012"
# 
# $stops_in_the_year_with_the_most_stops
# [1] "40497"
# 
# $age_group_percentages1
# [1] "2.51395914077383"
# 
# $age_group_percentages2
# [1] "0.213492741246798"
# 
# $age_group_percentages3
# [1] "6.64126650463115"
# 
# $age_group_percentages4
# [1] "37.0656243841556"
# 
# $age_group_percentages5
# [1] "29.2360244367076"
# 
# $age_group_percentages6
# [1] "12.7773763384353"
# 
# $age_group_percentages7
# [1] "8.62970505156671"
# 
# $age_group_percentages8
# [1] "2.45680877619392"
# 
# $age_group_percentages9
# [1] "0.359324706036918"
# 
# $age_group_percentages10
# [1] "0.10641792025225"
# 
# $age_group_stopped_the_most
# [1] "18-24"