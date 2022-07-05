
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


## 1. header ------------------------------
header <- 
  dashboardHeader(title = HTML("Let's learn stats!"), 
                  disable = FALSE, 
                  titleWidth  = 550
                  
  )

## 2. siderbar ------------------------------
siderbar <- 
  dashboardSidebar( 
    width = 200,
    sidebarMenu(
      id = 'sidebar',
      style = "position: relative; overflow: visible;",
      #style = "position: relative; overflow: visible; overflow-y:scroll",
      #style = 'height: 90vh; overflow-y: auto;',

      menuItem("Overview",
               tabName = "OverviewTab",
               icon = icon('dashboard',lib="glyphicon")
      ),
      
      menuItem("Maths", 
               tabName = "MathsTab", 
               icon = icon("calculator"), startExpanded = FALSE,
               menuSubItem('Addition', tabName = "mathsaddition", 
                           icon = icon('plus', lib = 'font-awesome')),
               menuSubItem('Subtraction', tabName = "mathssubtraction", 
                           icon = icon('minus', lib = 'font-awesome')),
               menuSubItem('Mixture', tabName = "mathscal", 
                           icon = icon('infinity', lib = 'font-awesome'))
      ),
      
      
      menuItem("Chapter 1: Probability", 
               tabName = "S1Tab", 
               icon = icon("percent"), startExpanded = FALSE,
               menuSubItem('Probability', tabName = "ss1", 
                           icon = icon('plus', lib = 'font-awesome')),
               menuSubItem('Distributions', tabName = "ss2", 
                           icon = icon('plus', lib = 'font-awesome'))
      ),
      
      menuItem("Chapter 2: Hypothesis testing", 
               tabName = "S2Tab", 
               icon = icon("spinner"), startExpanded = FALSE,
               menuSubItem('Hypotheses', tabName = "ss3", 
                           icon = icon('percent', lib = 'font-awesome')),
               menuSubItem('Hypotheses for a mean', tabName = "ss4", 
                           icon = icon('percent', lib = 'font-awesome'))
      )
      
      
    )
  )

## 3. body --------------------------------
body <- dashboardBody( 
  
  tabItems(
    
    tabItem(tabName = "mathsaddition",
            h2("Maths addition exercise"),
            fluidRow(
              column(6,
                sliderInput("addslide", "Choose a range", min = 0, 
                            max = 100, value = 20, step = 10, round=TRUE)
              )),
            fluidRow(
              column(6,
                actionButton("addbutton","Generate tests")
              )),
            fluidRow(
              column(6,
                p(HTML("<b>Let's begin</b>")),
                DT::dataTableOutput("addtable")
              )),
            fluidRow(
              column(6,
                     actionButton("addsubbutton","Submit results")
              )
            )
    ),
    
    tabItem(tabName = "mathssubtraction",
            h2("Maths subtraction exercise"),
            fluidRow(
              column(6,
                     sliderInput("minusslide", "Choose a range", min = 10, 
                                 max = 100, value = 20, step = 10, round=TRUE)
              )),
            fluidRow(
              column(6,
                     actionButton("minusbutton","Generate tests")
              )),
            fluidRow(
              column(6,
                     p(HTML("<b>Let's begin</b>")),
                     DT::dataTableOutput("minustable")
              )),
            fluidRow(
              column(6,
                     actionButton("minussubbutton","Submit results")
              )
            )
    ),
    
    # First tab content
    tabItem(tabName = "ss1",
            fluidRow(
              box(highchartOutput("plot1", height = 250)),
              box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
              )
            )
    ),
    
    # Second tab content
    tabItem(tabName = "ss2",
            h2("Widgets tab content")
    )
  )
  
  
)



## put UI together --------------------
ui <- dashboardPage(header, siderbar, body)