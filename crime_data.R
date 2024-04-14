#Load in the following packages
library(tidyverse)

#Raw file containing URL's saved into enviroment
URLs <- read_csv("mps_monthly_crim_dashboard_data_urls.csv")


#QUESTIONS
#We have 52 urls, how do we deal with them?
#Find out what files i need programatically - what way do i need to check them?
#To check them, the files each reference a financial year
#Checks to carry out for TNO files - Check that the Month_Year column highest value is March and the Financial Year is x
#Extract the URL from the tibble
# Check the first x files - randomly select x files and see what the pattern is


#STEP 1 - Split the URL column into 2 to show those which are TNO and those which are Other
# Split the tibble into a list based on URL content
URLs_split <- split(URLs, ifelse(str_detect(URLs$value, "TNO"), "TNO", "Other"))

Other_list <- URLs_split[["Other"]]
TNO_list <- URLs_split[["TNO"]]

#STEP 2 - Identify the criteria - Full Financial Year (Determined by March 1st) - URL says fy(followed by the financial year mm-yy.csv for files that are a full financial year)
#For each complete financial year for both TNO and Other 
#Have TNO script as both 
year_list <- c("fy17-18.csv", "fy18-19.csv", "fy19-20.csv", "fy20-21.csv", "fy21-22.csv", "fy22-23.csv")

#step 3a TNO VERSION - Filter out the URL's which do not contain any script from the year_list
#Checking TNO_list to see which of the URLs contain any of the strings in year_list
TNO_list_filter <- TNO_list |> 
  mutate(contains_year = sapply(value, function(url) any(grepl(paste(year_list, collapse = "|"), url)))) |>
  filter(contains_year) |>
  select(value)

#STEP 4a - Load in the raw files using read_csv
#Load in the files (data is from 2017 DOES NOT INCLUDE 22-23 OR 23-24)
complete_TNO_years <- read_csv(TNO_list_filter$value)

#STEP 3b Other VERSION - Filter out the URL's which do not contain any script from year_list
Other_list_filter <- Other_list |>
  mutate(contains_year = sapply(value, function(url) any(grepl(paste(year_list, collapse = "|"), url)))) |>
  filter(contains_year) |>
  select(value)

#STEP 4b Other VERSION - Load in the raw files using read_csv
complete_other_years <- read_csv(Other_list_filter$value)
