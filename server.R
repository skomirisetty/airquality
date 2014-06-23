# Adding required libraries 
library(shiny)
library(datasets)
library(ggplot2)

air<-airquality
# Calculate Average Temperature, Wind by Month
mn<-round(aggregate(x=air,by=list(air$Month),FUN='mean',simplify=TRUE),0)

mnval<-data.frame(mn)


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {

  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$MonthPlot expressions
  
  formulaText<-reactive({
    paste(input$Variable, " ~ Month")
  })
  
  # Return the formula text for printing as a caption
  output$Caption <- renderText({
    formulaText()
  })
  
  # Return the summary data for printing as a summary
  output$summary <- renderPrint({
    summary(air)
  })
    
  # Generate a plot of the requested variable (Wind, Temerature) against Month
  output$MonthPlot <- renderPlot({
    plot(as.formula(formulaText()),
            data = mn,type="l",lwd=2,col="red",
            outline = input$outliers)
  })
})