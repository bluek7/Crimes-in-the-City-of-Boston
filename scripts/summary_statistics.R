# @author Michael Lew
# Part 1: Data wrangling:
#
#   Dataset used: Field interrogation/observation results
#   in the City of Boston by the Boston Police Department

library(dplyr)

# This function takes in a dataset as a parameter,
# then returns a list of information about that dataset

# -> Example of how to access information in a list:
# If the list is called "summary", then
# summary[['observations']] will display the value of 'observations'

summarise_data <- function(df) {
  
  # Allows the sum to be formed when a dataframe is grouped
  df$count <- 1
  
  # Now start up a list of information about the data to return:
  returnList <- list()
  
  #___________________________________
  # 1) Total number of observations
  observations <- length(rownames(df))
  
  #___________________________________
  # 2) Percentage of stops that were African American, White, Hispanic
  # br stands for by_race
  br <- group_by(df, Race) %>%
    summarise(
      total = sum(count),
      proportion = total / observations,
      percentage = proportion * 100
    )
  # Write it to a file that can be read
  write.csv(br, "data/stops_by_race.csv")
  View(br)
  
  # Vector containing information as a list
  br_info <- c(
    American_Indian_or_Alaskan_Native <-
      br$Percentage[br$Race == "American Indian or Alaskan Native"],
    
    Asian_or_Pacific_Islander <-
      br$Percentage[br$Race == "Asian or Pacific Islander"],
    
    Black <-
      br$Percentage[br$Race == "Black"],
    
    Hispanic <-
      br$Percentage[br$Race == "Hispanic"],
    
    Middle_Eastern_or_East_Indian <-
      br$Percentage[br$Race == "Middle Eastern or East Indian"],
    
    White <-
      br$Percentage[br$Race == "White"]
  )
  
  #___________________________________
  # 3) Percentage of stops that were Male, Female
  # bs stands for by_sex
  bs <- group_by(df, Sex) %>%
    summarise(
      total = sum(count),
      proportion = total / observations,
      percentage = proportion * 100
    )
  write.csv(bs, "data/stops_by_sex.csv")
  View(bs)
  
  bs_info <- c(
    Male    <- bs$percentage[bs$Sex == "MALE"],
    Female  <- bs$percentage[bs$Sex == "FEMALE"],
    Unknown <- bs$percentage[bs$Sex == "UNKNOWN"]
  )
  
  #___________________________________
  # 3) Year With most stops, and number of stops that year
  # by stands for by_year
  by <- group_by(df, Year) %>%
    summarise(
      total = sum(count)
    )
  write.csv(by, "data/stops_by_year.csv")
  View(by)

  # Get year with most stops and the number of stops that year
  year_most <- by$Year[by$total == max(by$total)]
  year_most_value <- max(by$total)
  
  #___________________________________
  # 4) Age range that contains most stops, of:
  # [-1],    [0-11],  [12-17], [18-24], [25-34],
  # [35-44], [45-54], [55-64], [65-74], [75+]
  
  # ba stands for by_age_group
  ba <- group_by(df, Age_group) %>%
    summarise(
      total = sum(count),
      proportion = total / observations,
      percentage = proportion * 100
    )
  write.csv(ba, "data/stops_by_age_group.csv")
  View(ba)
  
  # Age group that is stopped the most often
  age_group_most <- ba$Age_group[ba$total == max(ba$total)]
  
  ba_info <- c(
    Age_undefined <- ba$percentage[ba$Age_group == "Undefined"],
    Age_0t11  <- ba$percentage[ba$Age_group == "0-11"],
    Age_12t17 <- ba$percentage[ba$Age_group == "12-17"],
    Age_18t24 <- ba$percentage[ba$Age_group == "18-24"],
    Age_25t34 <- ba$percentage[ba$Age_group == "25-34"],
    Age_35t44 <- ba$percentage[ba$Age_group == "35-44"],
    Age_45t54 <- ba$percentage[ba$Age_group == "45-54"],
    Age_55t64 <- ba$percentage[ba$Age_group == "55-64"],
    Age_65t74 <- ba$percentage[ba$Age_group == "65-74"],
    Age_75t   <- ba$percentage[ba$Age_group == "75+"]
  )
    
  
  #___________________________________
  # Assembling everything into a list, and return it
  # http://www.r-tutor.com/r-introduction/list/named-list-members
  
  returnList <- as.list(c(
    total_observations = observations,
    race_percentages = br_info,
    sex_percentages = bs_info,
    year_with_the_most_stops = year_most,
    stops_in_the_year_with_the_most_stops = year_most_value,
    age_group_percentages = ba_info,
    age_group_stopped_the_most = age_group_most
  ))
  print(returnList)
  return(returnList)
}







