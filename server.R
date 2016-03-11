
#Jacob Burke
#March 1, 2015
#INFO 498f

#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)
library(dplyr)

#data <- read.csv("data/Boston_Police_Department_FIO.csv")
#dataAge <- read.csv("data/stops_by_age_group.csv")
#dataRace <- read.csv("data/stops_by_race.csv")
#dataSex <- read.csv("data/stops_by_sex.csv")
#dataYear <- read.csv("data/stops_by_year.csv")

#Type of Interface for this application
shinyServer(
  function(input, output){
    
    output$plotAge <- render_plotly("Pullovers by Age", dataAge, 
                                    dataAge$Age, dataAge$total, 'bar', input$color)
    output$plotRace <- render_plotly("Pullovers by Race", dataRace, 
                                     dataRace$Race, dataRace$total, 'bar', input$color)
    output$plotSex <- render_plotly("Pullovers by Sex", dataSex, 
                                    dataSex$Sex, dataSex$total, 'bar', input$color)
    output$plotYear <- render_plotly("Pullovers by Year", dataYear, 
                                     dataYear$Year, dataYear$total, 'bar', input$color)
    
    output$summaryAge <- makeTable(dataAge)
    output$summaryRace <- makeTable(dataRace)
    output$summarySex <- makeTable(dataSex)
    output$summaryYear <- makeTable(dataYear)
  }
)

render_plotly <- function(chart_title, dataWildcard, x_values, y_values, chart_type, colour) {
  renderPlotly({
    dataWildcard %>% plot_ly(type = chart_type,
                             x = x_values, y = y_values, 
                             marker = list(color = colour)
    ) %>%
      layout(title = chart_title)
  })
}

makeTable <- function(dataframe) {
  renderDataTable({
    dataframe
  })
}
