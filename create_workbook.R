library(openxlsx)
# Create a workbook which has enough information to create a blank worksheet. Go over the dataframes in R and add them to sheets one by one and then write to file. Can also add styles and charts if needed
## Write one table and then move along to a different column - eventually add meta data
#Eventually save to sharepoint directory but in the Q drive for now
#Created by Josh on X date
wb <- createWorkbook()

#List
Worksheets <- c("TNO", "Domestic_Abuse", "Sexual_Offences","AWL_Knife_U25", "Homicide", "Robbery_Offences","Burglary_Offences")

#Add worksheets to workbook
addWorksheet(wb, "TNO")
writeData(wb, "TNO", TNO)

addWorksheet(wb, "Domestic Abuse")
writeData(wb, "Domestic Abuse", Domestic_Abuse)

addWorksheet(wb, "Sexual_Offences")
writeData(wb,"Sexual_Offences", Sexual_Offences)

addWorksheet(wb, "AWL_Knife_U25")
writeData(wb, "AWL_Knife_U25", ND_Knife_Crime)

addWorksheet(wb, "Homicide")
writeData(wb, "Homicide", Homicide_Offences)

addWorksheet(wb, "Robbery_Offences")
writeData(wb,"Robbery_Offences", Personal_Robbery)

addWorksheet(wb, "Burglary_Offences")
writeData(wb, "Burglary_Offences", Burglary_Offences)

addWorksheet(wb, "TfMV_Offences")
writeData(wb,"TfMV_Offences", Motor_Vehicle_Theft)

addWorksheet(wb, "Theft_Person")
writeData(wb, "Theft_Person", Theft_Person)

#Save the completed workbook to my working directory
saveWorkbook(wb, "State_Of_London_Crime.xlsx", overwrite = TRUE)
