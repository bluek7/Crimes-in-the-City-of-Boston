
#Install Shiny package and library
#install.packages("shiny")
library(shiny)

#Type of Interface for this application
shinyUI(
  
  fluidPage(
    
    #Title of the application
    titlePanel(title = h2("Assignment 8 - Building Applications", align = "center")),
  
      
      #Main Panel that produces/outputss the Histogram
      mainPanel(
        tabsetPanel(
          tabPanel("Age", plotlyOutput("barAge")), 
          tabPanel("Race", plotlyOutput("barRace")), 
          tabPanel("Sex", plotlyOutput("barSex")), 
          tabPanel("Year", plotlyOutput("barYear"))
        )
      
    )
  )
)