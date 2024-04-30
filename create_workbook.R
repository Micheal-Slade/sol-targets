library(openxlsx)
# Create a workbook which has enough information to create a blank worksheet. Go over the dataframes in R and add them to sheets one by one and then write to file. Can also add styles and charts if needed
## Write one table and then move along to a different column - eventually add meta data
#Eventually save to sharepoint directory but in the Q drive for now
#Created by Josh on X date
wb <- createWorkbook()

#List
Worksheets <- c("TNO","Non-Domestic Violences with Injury Offences", "Domestic_Abuse", "Sexual_Offences","AWL_Knife_U25", "Homicide", "Robbery_Offences","Burglary_Offences")

#Add worksheets to workbook
#Figure 1
addWorksheet(wb, "TNO")
writeData(wb, "TNO", TNO)

TNO_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Total Notifiable Offences", "The number of Offences recorded by the MPS (Thousands)")
)


writeData(wb, "TNO", TNO_Meta,startRow = 2, startCol = ncol(TNO)+4)

#Figure 2
addWorksheet(wb,"ND-VWI")
writeData(wb,"ND-VWI", ND_Violence)

ND_VWI_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Non Domestic - Violence With Injury Offences", "Number of offences recorded by the MPS")
)

writeData(wb, "ND-VWI", ND_VWI_Meta,startRow = 2, startCol = ncol(TNO)+4)

#Figure 3
addWorksheet(wb, "Domestic Abuse")
writeData(wb, "Domestic Abuse", Domestic_Abuse)

DA_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value= c("Domestic Abuse Offences", "The number of Offences recorded by the MPS (Thousands)")
)

writeData(wb, "Domestic Abuse", DA_Meta,startRow = 2, startCol = ncol(TNO)+4)

#Figure 4 
addWorksheet(wb, "Sexual_Offences")
writeData(wb,"Sexual_Offences", Sexual_Offences)

SO_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Sexual Offences", "The number of offences recorded by the MPS")
)

writeData(wb,"Sexual_Offences", SO_Meta, startCol = ncol(Sexual_Offences)+4,startRow = 2)

#Figure 5
addWorksheet(wb, "AWL_Knife_U25")
writeData(wb, "AWL_Knife_U25", ND_Knife_Crime)

AWL_Knife_U25_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Non-Domestic Knife Crime with Injury Offences – Victim U25", "Number of offences recorded by the MPS")
)

writeData(wb,"AWL_Knife_U25", AWL_Knife_U25_Meta,startCol =  ncol(ND_Knife_Crime)+4,startRow = 2)

#Figure 6
addWorksheet(wb, "Homicide")
writeData(wb, "Homicide", Homicide_Offences)

Homicide_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Homicide Offences", "Number of offences recorded by the MPS ")
)

writeData(wb, "Homicide", Homicide_Meta, startCol = ncol(Homicide_Offences)+4,startRow = 2)

#Figure 7
addWorksheet(wb, "Robbery_Offences")
writeData(wb,"Robbery_Offences", Personal_Robbery)

Robbery_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Robbery Offences", "Number of offences recorded by the MPS")
)

writeData(wb, "Robbery_Offences", Robbery_Meta, startCol = ncol(Personal_Robbery)+4,startRow = 2)

#Figure 8
addWorksheet(wb, "Burglary_Offences")
writeData(wb, "Burglary_Offences", Burglary_Offences)

Burglary_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Burglary Offences", "Number of offences recorded by the MPS")
)

writeData(wb, "Burglary_Offences", Burglary_Meta, startCol = ncol(Burglary_Offences)+4,startRow = 2)

#Figure 9
addWorksheet(wb, "TfMV_Offences")
writeData(wb,"TfMV_Offences", Motor_Vehicle_Theft)

TfMV_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Theft from Motor Vehicle Offences", "Number of offences recorded by the MPS")
)

writeData(wb,"TfMV_Offences", TfMV_Meta, startCol = ncol(Motor_Vehicle_Theft)+4,startRow = 2)

#Figure 10
addWorksheet(wb, "Theft_Person")
writeData(wb, "Theft_Person", Theft_Person)

Theft_Person_Meta <- data.frame(
  meta = c("Title", "Subtitle"),
  value = c("Personal Theft Offences", "Number of offences recorded by the MPS (Thousands)")
)

writeData(wb, "Theft_Person", Theft_Person_Meta, startCol = ncol(Theft_Person)+4,startRow = 2)

#Save the completed workbook to my working directory
saveWorkbook(wb, "State_Of_London_Crime.xlsx", overwrite = TRUE)

