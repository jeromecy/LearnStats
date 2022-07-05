
# source("preload.R")
library(shiny)
library(shinythemes)
library(shinydashboard)
library(dashboardthemes)
library(DT)
library(shinyWidgets)
library(ggplot2)
library(highcharter)
library(shinyjs)
library(dplyr)

server <- function(input, output, session) {
  
  source(file = "mainserver.R", local = TRUE)$value
  
  
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$plot1 <- renderHighchart({
    hchart(density(rnorm(input$slider)), 
           type = "area", name = "Density")
  })
  
}