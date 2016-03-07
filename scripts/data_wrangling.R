# @author Michael Lew
# Part 1: Data wrangling:
#
#   Dataset used: Field interrogation/observation results
#   in the City of Boston by the Boston Police Department

library(dplyr)

#__________________________
# Select the .csv so it only contains what we need:
# Race, Age, Sex, District Number, Date

# wrangle function: accepts the data frame as a parameter
# and reduces it to only show the columns we need
wrangle <- function(original_df) {
  df <- select(original_df,
               # Race (container for all)
               Race_full=RACE_DESC,
               
               # Age
               Age=AGE_AT_FIO_CORRECTED,
               
               # Sex
               Sex=SEX,
               
               # District id
               District_ID=DIST_ID,
               
               # Date (will be changed to just display Year)
               Year=FIO_DATE_CORRECTED
               )
  # Add an age group column representing what age group a person belongs to
  df <- append_age_group(df)
  
  # Run it through the refactor() function,
  # changing the values associated with Race and Date/Year
  return(refactor(df))
}

# Adds the Age_group column to the dataframe
append_age_group <- function(df) {
  return(df %>% mutate(
    Age_group =
      ifelse(Age %in% 0:11, "0-11",
      ifelse(Age %in% 12:17, "12-17",
      ifelse(Age %in% 18:24, "18-24",
      ifelse(Age %in% 25:34, "25-34",
      ifelse(Age %in% 35:44, "35-44",
      ifelse(Age %in% 45:54, "45-54",
      ifelse(Age %in% 55:64, "55-64",
      ifelse(Age %in% 65:74, "65-74",
      ifelse(Age >= 75, "75+", "Undefined")))))))))
  ))
}


#__________________________
# refactor function: changes the value names to be more readable
# or only tell what we want
refactor <- function(df) {
  
  #__________________________
  # Change the date format to just display the Year:
  
  # -> Replace the space in the date format with a slash
  df$Year <- gsub(" ", "/", df$Year)
  
  # -> Break the date on occurence of "/" and get the 3rd value, the Year
  df$Year <- list_revert(df$Year, "/", 3, "numeric")
  
  #__________________________
  # Make two columns that correspond to race:
  
  # -> df$Race_full: already exists, will be split into 2 columns
  df$Race_full <- gsub("\\)", "\\(", df$Race)
  
  # -> df$Race: The category race that was given, without the letter
  df$Race_id <- list_revert(df$Race_full, "\\(", 1, "character")
  
  # -> df$Race_id: Just the letter that corresponds to race (A, B, M, W, etc.)
  df$Race <- list_revert(df$Race_full, "\\(", 2, "character")
  
  # Remove the Race_full column
  df$Race_full <- NULL
  
  return(df)
}

#__________________________
# Helper function area:

# list_revert: splits a value on a certain value,
# then gets a certain value index out of the string split into a vector
list_revert <- function(split_from, split_on, get_index, as_type) {
  to_return <- lapply(strsplit(split_from, split_on), function(x) x[get_index])
  unlist(to_return)
  switch(as_type,
         numeric = (to_return <- as.numeric(to_return)),
         character = (to_return <- as.character(to_return))
         )
  return(to_return)
}








