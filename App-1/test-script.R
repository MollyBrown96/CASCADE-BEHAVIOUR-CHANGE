library(shiny)
runApp("App-1")


# Load data from external CSV file
case_studies_data <- read.csv("Data-Test-2.csv", stringsAsFactors = FALSE)

# Print column names to check
print(colnames(case_studies_data))
