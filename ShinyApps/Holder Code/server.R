data <- read.csv("Boston_Police_Department_FIO.csv")

#Jacob Burke
#March 1, 2015
#INFO 498f

#Install Shiny package and library
#install.packages("shiny")
library(shiny)

#Type of Interface for this application
shinyServer(
  
  function(input, output){
    
    output$sum <- renderPrint ({
      summary(iris)
    })
    
    output$str <- renderPrint({
      str(iris)
      
    })
    
    output$data <- renderTable({
      coloum <- as.numeric(input$variable)
      iris[coloum ]
      
    })
    
    #Renders Histogram
    output$hist <- renderPlot({
      coloumn <- as.numeric(input$variable)
      
      #Creates Histogram
      hist(iris[,coloumn], 
           breaks = seq(0, max(iris[,coloumn]), l = input$bins + 1), 
           col=input$color, main = "Histogram of Iris Dataset", 
           xlab = names(iris[coloumn]))
    })
    
    #Renders Boxplot
    output$box <- renderPlot({
      coloumn <- as.numeric(input$variable)
      # Creates Box Plot 
      boxplot(iris[,coloumn], 
           breaks = seq(0, max(iris[,coloumn])), 
           col=input$color, main = "Boxplot of Iris Dataset", 
           xlab = names(iris[coloumn]))
    })
    
    #Renders Pie Chart
    output$pie <- renderPlot({
      coloumn <- as.numeric(input$variable)
      # Creates Pie Chart 
      pie(iris[,coloumn], 
              breaks = seq(0, max(iris[,coloumn])), 
              col=input$color, main = "Pie Chart of Iris Dataset", 
              xlab = names(iris[coloumn]))
    })
  }
)
