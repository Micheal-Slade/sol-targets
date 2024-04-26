library(openxlsx)
# Create a workbook which has enough information to create a blank worksheet. Go over the dataframes in R and add them to sheets one by one and then write to file. Can also add styles and charts if needed
## Write one table and then move along to a different column - eventually add meta data
#Eventually save to sharepoint directory but in the Q drive for now
#Created by Josh on X date
wb <- createWorkbook()


saveWorkbook(wb, "basics.xlsx", overwrite = TRUE)  ## save to working directory
