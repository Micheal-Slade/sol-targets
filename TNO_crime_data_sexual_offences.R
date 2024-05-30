# Task 1 please migrate all your previous Work into this script.
#TNO Data to show the Total Sexual Offenses data
#Load in the relevant packages
library(readr)
library(lubridate)
library(dplyr)
library(here)

# read in the data files
## Josh - Future plan to go through and automate the obtaining of new data - once checking financial year is complete can file be permentantly housed below as a permenant line of script? 
TNOCrimeData2324 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS_MonthlyCrimeDashboard_TNOCrimeData.csv")
TNOCrimeData2223 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS Monthly Crime Dashboard_BoroughSNT_TNOCrimeDatafy22-23_03.csv")
TNOCrimeData2122 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS_BoroughSNT_TNOCrimeDatafy21-22.csv")
TNOCrimeData2021 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS_BoroughSNT_TNOCrimeDatafy20-21.csv")
TNOCrimeData1920 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS_BoroughSNT_TNOCrimeDatafy19-20.csv")
TNOCrimeData1819 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS_BoroughSNT_TNOCrimeDatafy18-19.csv")
TNOCrimeData1718 <- read_csv("C:/Users/JGill/Greater London Authority/IU - Josh State of London Task/The_State_of_London_Crime/data/MPS_BoroughSNT_TNOCrimeDatafy17-18.csv")

# Convert Month_Year values into Date format
#TNOCrimeData2324$Month_Year <- as.Date(TNOCrimeData2324$Month_Year, format = "%d/%m/%Y")

TNO_list <- list(TNOCrimeData1718, TNOCrimeData1819, TNOCrimeData1920, TNOCrimeData2021, TNOCrimeData2122, TNOCrimeData2223, TNOCrimeData2324)

#Michael Task 2
##Step 1 - convert the minimum date of Month_Year of current folder into a variable
Min_24 <- min(TNOCrimeData2324$Month_Year)


##Step 2 - convert the max date of Month_Year of last folder into variable
Max_23 <- max(TNOCrimeData2223$Month_Year)

##Step 3 - min 24 is greater than max 23
Min_24 > Max_23

# Challenge - Extract the month value from both and if the difference is one 
file_date_check <- function(Max_23, Min_24) {
  # check to see if the maximum date of the previous full financial year is less than the lowest date of the newest file
  if (Max_23 < Min_24) {
    return(TRUE)  # Dates are in correct order
  } else {
    stop("Previous files dates overlap with most recent TNO Data file") 
  }
}
result <- file_date_check(Max_23, Min_24)
# If you have two dates, strptime (sp) unit = days the output would be the number 31 and could change the unit to month so it is one - check the documentation

# join the data files together as TNOCrimeData
TNOCrimeData <- bind_rows(TNO_list) 

# filter the data to view only the 
TNOCrimeData <- TNOCrimeData %>%
  filter(Measure == "Offences") %>%
  filter(`Offence Group` == "Sexual Offences")

