# Load required libraries
library(shiny)
library(datasets)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Air Quality by Month"),
  
  # Sidebar with controls to select a variable to plot Month against Temperature (in Fahrenheit), Wind(miles per hour)
  sidebarPanel(
 
    selectInput("Variable","Variable", list("Temperature" = "Temp", "Wind" = "Wind"), selected = NULL, multiple = FALSE),
    checkboxInput("outliers", "Show outliers", FALSE)
    ),
  
   # Show a summary of the dataset and an HTML table with the requested number of observations
  mainPanel(
    
    verbatimTextOutput("summary"),
    
    h3(textOutput("Caption")),
    
    plotOutput("MonthPlot")
  )
  
))