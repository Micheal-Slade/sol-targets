library(tidyverse)
library(lubridate)
library(dplyr)


#Figure 1 - Total Crime Offences 
TNO <- TNO_data |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(`Parsed_Dates`) |>
  arrange(Month_Year) |> 
  summarise(count = sum(Count)) 

#Figure 2 - Non Domestic Violences with Injury Offences
ND_Violence_TNO <- TNO_data |>
  filter(`Offence Subgroup` %in% "Violence with Injury") |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))

Dom_Violence_Other <- Other_data |>
  filter(`Crime Subtype` %in% "Domestic Abuse Violence with Injury") |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))

#Merge the two tables together
ND_Violence <- merge(ND_Violence_TNO, Dom_Violence_Other, by = "Month_Year", all = TRUE)

#Replace any NA values with 0
ND_Violence[is.na(ND_Violence)] <- 0

#Create the Count by the count of Violence with Injury minus the Domestic Violence Count
ND_Violence$Count <- (ND_Violence$count.x-ND_Violence$count.y)

ND_Violence <- ND_Violence |>
  select(`Month_Year`, `Count`)
 
#Drop excess tables
rm(Dom_Violence_Other, ND_Violence_TNO)

#Figure 3 - Domestic Abuse Offences 
Domestic_Abuse <- Other_data |>
  filter(`Crime Type` %in% "Domestic Abuse") |>
  filter(`Crime Subtype` %in% "Domestic Abuse") |>
  filter(grepl("Offences", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))
  
# Figure 4 - Sexual Offences
# Step 1 - Filter out only the variables "Other Sexual Offences" & "Rape" from "Offence Subgroup" and only show Offences
Sexual_Offences <- TNO_data |>
  filter(`Offence Subgroup` %in% c("Rape", "Other Sexual Offences")) |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`))

# Pivot the filtered variables to their own columns and summarize from Count
Sexual_Offences <- Sexual_Offences |>
  pivot_wider(names_from = `Offence Subgroup`, values_from = Count) |>
  select(Month_Year, Rape, `Other Sexual Offences`) |>
  group_by(Month_Year) |>
  summarise(`Other Sexual Offences` = sum(`Other Sexual Offences`, na.rm = TRUE),
            Rape = sum(Rape, na.rm = TRUE),)

#Figure 5 - Non-Domestic Knife Crime with Injury Offences – Victim U25
ND_Knife_Crime <- Other_data |>
  filter(`Crime Subtype` %in% "Knife Injury Victims (non DA 1-24)" ) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))

#Figure 6 - Homicide Offences
Homicide_Offences <- TNO_data |>
  filter(`Offence Subgroup` %in% "Homicide") |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))

#Figure 7 - Personal Robbery
#Only report on "Robbery of Personal Property" in "Offence Subgroup" - remove Outcomes and filter on Borough
Personal_Robbery <- TNO_data |>
  filter(`Offence Subgroup`%in% "Robbery of Personal Property") |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))

#Figure 8 - Burglary Offences
Burglary_Offences <- TNO_data |>
  filter(`Offence Group` %in% "Burglary") |>
  filter(grepl("Borough", `Area Type`)) |>
  filter(!grepl("Outcomes", Measure))

 Burglary_Offences <- Burglary_Offences |>
 pivot_wider(names_from = `Offence Subgroup`, values_from = Count) |>
 select(Month_Year, `Domestic Burglary`, `Burglary Business and Community`) |>
   group_by(Month_Year) |>
 summarise(`Domestic Burglary` = sum(`Domestic Burglary`, na.rm = TRUE),
             `Burglary Business and Community` = sum(`Burglary Business and Community`, na.rm = TRUE))

 #Figure 9 - Theft from Motor Vehicle Offences 
 Motor_Vehicle_Theft <- TNO_data |>
   filter(`Offence Group` %in% "Vehicle Offences") |>
   filter(grepl("Borough", `Area Type`)) |>
   filter(!grepl("Outcomes", Measure)) |>
   filter(grepl("Theft from a Motor Vehicle",`Offence Subgroup`)) |>
   group_by(Month_Year) |>
   summarise(count = sum(Count))
 
 #Figure 10 - Theft from Person Offences
 Theft_Person <- TNO_data |>
   filter(`Offence Group` %in% "Theft") |>
   filter(grepl("Borough", `Area Type`)) |>
   filter(!grepl("Outcomes", Measure)) |>
   filter(grepl("Theft from Person",`Offence Subgroup`)) |>
   group_by(Month_Year) |>
   summarise(count = sum(Count))
 
 #Figure 11 - Fraud and Cyber Crime
 #DATA LOCATION UNKNOWN
 
 #Figure 12 - Anti Social Behaviour
 
 #Figure 13 - Harassment
 
 #Figure 14 - Feeling Safe After Dark
 
 #Figure 15 - Satisfaction Level of Reporting Victims (MPS)
 
 #Figure 16 - Fair Treatment by the Metropolitan Police Service
 
 #Bonus Figure - Hate Crime
 #Offences where the Crime Subtype are flagged as Hate Crime - note, the wider Crime Type of Hate crime encompasses all
 Hate_Crime <- Other_data |>
   filter(`Crime Subtype` %in% "Hate Crime") |>
   filter(grepl("Borough", `Area Type`)) |>
   filter(grepl("Offences", Measure)) |>
   group_by(Month_Year) |>
   summarise(count = sum(Count))
 
 