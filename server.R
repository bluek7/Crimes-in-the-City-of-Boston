
#Jacob Burke
#March 1, 2015
#INFO 498f

#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)
library(dplyr)

#data <- read.csv("data/Boston_Police_Department_FIO.csv")
dataAge <- read.csv("data/stops_by_age_group.csv")
dataRace <- read.csv("data/stops_by_race.csv")
dataSex <- read.csv("data/stops_by_sex.csv")
dataYear <- read.csv("data/stops_by_year.csv")

#Type of Interface for this application
shinyServer(
  function(input, output){
    
    output$barAge <- renderPlotly({
        dataAge %>% plot_ly(type = 'bar', 
                    x = Age_group, y = total
                    ) %>% 
        layout(title = "Pullovers by Age")
    })
    
    output$barRace <- renderPlotly({
      dataRace %>% plot_ly(type = 'bar', 
                          x = Race, y = total
      ) %>% 
        layout(title = "Pullovers by Race")
    })
    
    output$barSex <- renderPlotly({
      dataSex %>% plot_ly(type = 'bar', 
                           x = Sex, y = total
      ) %>% 
        layout(title = "Pullovers by Sex")
    })
   
    output$barYear <- renderPlotly({
      dataYear %>% plot_ly(type = 'bar', 
                           x = Year, y = total
      ) %>% 
        layout(title = "Pullovers by Year")
    }) 
  }
)
