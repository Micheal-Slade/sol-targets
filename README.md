# sol-targets

Data wrangling for State of London - Crime Chapter

## Crime_data

Crime_data script file is run first, this uses a csv file containing a list of URL’s located on the datastore to a number of csv files of crime data both TNO (Total Notifiable Offences) and Other. The script checks the URL strings to identify which data set each URL is for by using string detect to identify if a URL references “TNO” or “Other” and splits them both into a list respectively. The script then creates a list of strings of financial years that are present in the URL’s to identify the year the file is for. The two lists are then filtered to include only the ones which contain a string from the “contains_year” list which will remove all of the incomplete partial year files and only return the files which contain a full financial year of data. The two lists are then read in using read_csv which will read in all of the URL’s in both lists and returns them both as data frames with all of the csv files joined as one. Then additional csv files are loaded in for any missing financial years and using rbind are bound to the data frames. For incomplete financial years the file is mutated and excess columns are dropped before being bound. Additional excess objects are then dropped at the end of the original script leaving only the completed TNO data frame and the Other data frame.

## Crime_and_Safety

This script takes the two objects produced in the Crime_data script and produces a number of outputs listed below:

-   Figure 1 - Total Crime Offences
-   Figure 2 - Non Domestic Violences with Injury Offences
-   Figure 3 - Domestic Abuse Offences
-   Figure 4 - Sexual Offences
-   Figure 5 - Non-Domestic Knife Crime with Injury Offences – Victim U25
-   Figure 6 - Homicide Offences
-   Figure 7 - Personal Robbery
-   Figure 8 - Burglary Offences
-   Figure 9 - Theft from Motor Vehicle Offences
-   Figure 10 - Theft from Person Offences
-   Figure 11 - Fraud and Cyber Crime
-   Figure 12 - Anti Social Behaviour
-   Figure 13 - Harassment
-   Figure 14 - Feeling Safe After Dark
-   Figure 15 - Satisfaction Level of Reporting Victims (MPS)
-   Figure 16 - Fair Treatment by the Metropolitan Police Service
-   Bonus Figure - Hate Crime

When filtering the data, every figure followed a similar pattern. Initially, the data is filtered by the Measure column to remove the outcomes, only show the offences. Then filtering the Area Type to only show "Borough" values. Each figure measures specific variables which are then filtered out by the "Offence Group" or "Offence Subgroup" columns.

In each instance, the data is then grouped by "Month_Year" and summarised by "Count" to show the total figures for each month.

<!--#I need to add additional specific details to the variations of the above figures-->

## Create_workbook

All of the outputs created in Crime_and_Safety script are added as worksheets within the "State_Of_London_Crime.xlsx". Each figure is saved on a different worksheet alongside meta data showing the title and subtitle of the data.

The file is then saved as "State_Of_London_Crime.xlsx".
