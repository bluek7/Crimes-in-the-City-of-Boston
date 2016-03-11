
#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)
library(markdown)
library(rmarkdown)

colours <- c("Blue" = "Blue", 
             "Red" = "Red", 
             "Yellow" = "Yellow", 
             "Green" = "Green", 
             "Orange" = "Orange", 
             "Black" = "Black")

#Type of Interface for this application
shinyUI(
  
  navbarPage(
    #Title of the application
    title = "CRIMES IN THE CITY OF BOSTON",
    
      tabPanel("Plots", 
               sidebarLayout(
                 sidebarPanel(
                   
                   radioButtons("color", 
                                "Color: ", 
                                choices = colours, 
                                selected = "Blue")
                ),
               
               mainPanel(
                 tabsetPanel(
                   tabPanel("Age", plotlyOutput("plotAge")), 
                   tabPanel("Race", plotlyOutput("plotRace")), 
                   tabPanel("Sex", plotlyOutput("plotSex")), 
                   tabPanel("Year", plotlyOutput("plotYear"))
                 )
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
        ),
    
    tabPanel("About",
             includeHTML('index.html')
             )
    
      #Main Panel that produces/outputss the Histogram
      
  )
)