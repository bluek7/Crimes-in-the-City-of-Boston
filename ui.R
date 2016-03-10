
#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)

#Type of Interface for this application
shinyUI(
  
  navbarPage(
    #Title of the application
    titlePanel(title = h2("Crimes in the City of Boston", align = "center")),
    
      tabPanel("Plots", 
               mainPanel(
                 tabsetPanel(
                   tabPanel("Age", plotlyOutput("barAge")), 
                   tabPanel("Race", plotlyOutput("barRace")), 
                   tabPanel("Sex", plotlyOutput("barSex")), 
                   tabPanel("Year", plotlyOutput("barYear"))
                 )
            )
          ),
      
      tabPanel("Summary",
         mainPanel(
           tabsetPanel(
             tabPanel("Age", dataTableOutput('summaryAge')), 
             tabPanel("Race", dataTableOutput('summaryRace')), 
             tabPanel("Sex", dataTableOutput('summarySex')), 
             tabPanel("Year", dataTableOutput('summaryYear'))
           )
          ) 
        )
      #Main Panel that produces/outputss the Histogram
      
  )
)