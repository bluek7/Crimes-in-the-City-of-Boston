
#Install Shiny package and library
#install.packages("shiny")
library(shiny)

#Type of Interface for this application
shinyUI(
  
  fluidPage(
    
    #Title of the application
    titlePanel(title = h2("Assignment 8 - Building Applications", align = "center")),
    
    #Sidebar panel
    sidebarLayout(
      sidebarPanel(  
        
        #Select what coloumn of the Iris Dataset you wish to see
        selectInput("variable", 
                    "Iris Dataset Variable:",
                    choices = c("Age Group" = 1, 
                                "Total" = 2, 
                                "Proportion" = 3, 
                                "Percentage" = 4), 
                    selected = 1),
        br(),
        
        #Select the number bins in the Histogram
        sliderInput("bins", 
                    "Number of Bins:",
                    min = 5, 
                    max = 50, 
                    value = 25),
        br(),
        
        #Selects the color of the bins
        radioButtons("color", 
                     "Color: ", 
                     choices = c("Blue", 
                                 "Red", 
                                 "Yellow", 
                                 "Green", 
                                 "Orange", 
                                 "Black"), 
                     selected = "Blue")
        
      ),
      
      #Main Panel that produces/outputss the Histogram
      mainPanel(
    tabsetPanel(type = "tab",
                tabPanel("Summary", verbatimTextOutput("sum")),
                tabPanel("Structure", verbatimTextOutput("str")),
                tabPanel("Data", tableOutput("data")),
                tabPanel("Histogram", plotOutput("hist")),
                tabPanel("Box Plot", plotOutput("box")),
                tabPanel("Pie Chart", plotOutput("pie"))
                ) 
    
      )
    )
  )
)