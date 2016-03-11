# INFO 498F
# SERVER

# Michael Lew
# Jon Jewik
# Jacob Burke
# Kush Gupta

#Install Shiny package and library
#install.packages("shiny")
library(shiny)
library(plotly)
library(dplyr)
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
    
    # Function for plotting bar graph for Age
    output$plotAge <- renderPlotly({
      dataAge %>% plot_ly(type = 'bar',
                               x = Age_group, y = total, 
                               marker = list(color = total)
      ) %>%
        layout(title = "Pullovers by Age")
    })
      
    # Function for plotting bar graph for Race
    output$plotRace <- renderPlotly({
      dataRace %>% plot_ly(type = 'bar',
                          x = Race, y = total, 
                          marker = list(color = total, colorscale = 'Blues', 
                                        reversescale = TRUE)
      ) %>%
        layout(title = "Pullovers by Race")
    })
    
    # Function for plotting bar graph for Sex
    output$plotSex <- renderPlotly({
      dataSex %>% plot_ly(type = 'bar',
                          x = Sex, y = total, 
                          marker = list(color = total, colorscale = 'Greys', 
                                        reversescale = TRUE)
      ) %>%
        layout(title = "Pullovers by Sex")
    })
    
    # Function for plotting bar graph for Year
    output$plotYear <- renderPlotly({
      dataYear %>% plot_ly(type = 'bar',
                          x = Year, y = total, 
                          marker = list(color = total, colorscale = 'Greens', 
                                        reversescale = TRUE)
      ) %>%
        layout(title = "Pullovers by Year")
    })
    
    
    # Functions for making tables for Age, Race, Sex and Year
    output$summaryAge <- makeTable(dataAge)
    output$summaryRace <- makeTable(dataRace)
    output$summarySex <- makeTable(dataSex)
    output$summaryYear <- makeTable(dataYear)
  }
)

# General function to render data table
makeTable <- function(dataframe) {
  renderDataTable({
    dataframe
  })
}
