library(tidyverse)

#Figure 1 - Total Crime Offences 
#Filter the data - only offences, not including domestic abuse, convert the Month_Year column to date value only show the 
total_crime_offences <- complete_TNO_years |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count)) #the total number of each month is far too high compared to previous entries so need to figure out the correct filters

# Figure 4 - Sexual Offences - THIS ONE IS VERY CLOSE TO THE EXCEL FILE PROVIDED BEFORE SO I AM CONFIDENT I AM ON THE RIGHT LINES (I HOPE)
# Step 1 - Filter out only the variables "Other Sexual Offences" & "Rape" from "Offence Subgroup" and only show Offences
Sexual_Offences <- complete_TNO_years %>%
  filter(`Offence Subgroup` %in% c("Rape", "Other Sexual Offences")) |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`))


# Pivot the filtered variables to their own columns and summarize from Count
Sexual_Offences <- Sexual_Offences %>%
  pivot_wider(names_from = `Offence Subgroup`, values_from = Count) %>%
  select(Month_Year, Rape, `Other Sexual Offences`) %>%
  group_by(Month_Year) %>%
  summarise(`Other Sexual Offences` = sum(`Other Sexual Offences`, na.rm = TRUE),
            Rape = sum(Rape, na.rm = TRUE),)

#Figure 7 - Personal Robbery
#Only report on "Robbery of Personal Property" in "Offence Subgroup" - remove Outcomes and filter on Borough
Personal_Robbery <- complete_TNO_years |>
  filter(`Offence Subgroup`%in% "Robbery of Personal Property") |>
  filter(!grepl("Outcomes", Measure)) |>
  filter(grepl("Borough", `Area Type`)) |>
  group_by(Month_Year) |>
  summarise(count = sum(Count))


#Thoughts so far - My totals for both figures are much higher than previously expected. Need to see clarity with Joe what needs to be included and what needs to be removed.
