
#Jacob Burke
#March 1, 2015
#INFO 498f

#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)
library(dplyr)
library(rmarkdown)
library(knitr)

#data <- read.csv("data/Boston_Police_Department_FIO.csv")
knit("index.Rmd")
dataAge <- read.csv("data/stops_by_age_group.csv")
dataRace <- read.csv("data/stops_by_race.csv")
dataSex <- read.csv("data/stops_by_sex.csv")
dataYear <- read.csv("data/stops_by_year.csv")

#Type of Interface for this application
shinyServer(
  function(input, output){
    
    output$plotAge <- renderPlotly({
      dataAge %>% plot_ly(type = 'bar',
                               x = Age_group, y = total, 
                               marker = list(color = input$color)
      ) %>%
        layout(title = "Pullovers by Age")
    })
      #render_plotly("Pullovers by Age", dataAge, 
       #                             dataAge$Age, dataAge$total, 'bar', input$color)
    output$plotRace <- renderPlotly({
      dataRace %>% plot_ly(type = 'bar',
                          x = Race, y = total, 
                          marker = list(color = input$color)
      ) %>%
        layout(title = "Pullovers by Race")
    })
    output$plotSex <- renderPlotly({
      dataSex %>% plot_ly(type = 'bar',
                          x = Sex, y = total, 
                          marker = list(color = input$color)
      ) %>%
        layout(title = "Pullovers by Sex")
    })
    output$plotYear <- renderPlotly({
      dataYear %>% plot_ly(type = 'bar',
                          x = Year, y = total, 
                          marker = list(color = input$color)
      ) %>%
        layout(title = "Pullovers by Year")
    })
    
    
    
    output$summaryAge <- makeTable(dataAge)
    output$summaryRace <- makeTable(dataRace)
    output$summarySex <- makeTable(dataSex)
    output$summaryYear <- makeTable(dataYear)
  }
)

makeTable <- function(dataframe) {
  renderDataTable({
    dataframe
  })
}
