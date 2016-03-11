# INFO 498F
# USER INTERFACE

# Michael Lew
# Jon Jewik
# Jacob Burke
# Kush Gupta

#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)

#Type of Interface for this application
shinyUI(
  
  navbarPage(
    #Title of the application
    title = "CRIMES IN THE CITY OF BOSTON",
    
    # HTML page for information 
    #tabPanel("About",
     #        includeHTML('index.html')
    #),
     
    # Tab for plots
      tabPanel("Plots", 
               sidebarLayout(
                 sidebarPanel(
                   "INFO 498F Project",
                   br(),
                   p("Team Members:"),
                   p("Michael Lew"),
                   p("Jon Jewik"),
                   p("Jacob Burke"),
                   p("Kush Gupta")
                ),
               
                # Plots in the main panel
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
      
      # Tab for Summary
      tabPanel("Summary",
               sidebarLayout(
                 sidebarPanel(
                   "INFO 498F Project",
                   br(),
                   p("Team Members:"),
                   p("Michael Lew"),
                   p("Jon Jewik"),
                   p("Jacob Burke"),
                   p("Kush Gupta")
                 ),
              
              # Data tables for age, race, sex and year
              mainPanel(
               tabsetPanel(
                 tabPanel("Age", dataTableOutput('summaryAge')), 
                 tabPanel("Race", dataTableOutput('summaryRace')), 
                 tabPanel("Sex", dataTableOutput('summarySex')), 
                 tabPanel("Year", dataTableOutput('summaryYear'))
              )
            ) 
          )
        )
    )
)