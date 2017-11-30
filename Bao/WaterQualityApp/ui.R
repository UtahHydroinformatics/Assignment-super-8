#
#
# This is the main ui CODE for Assignment 8

#
#
#
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

ui<-shinyUI( fluidPage(
  
  
  
  
  # Application title
  titlePanel("一些关于水资源质量的图表报告"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      selectInput("var", "请选择一个观测地址",
                  choices <- c("Utah Lake 2 miles West of Vineyard, UT" ,
                               "Scofield Reservoir",
                               "Deer Creek Reservoir" ,
                               "Utah Lake 1 mile West of Provo Marina" ,
                               "Utah Lake 1 mile East of Bird Island" )),
      
      
      selectInput("var2", "请选择一个X变量",
                  choices <- c("pH" ,
                               "ODO_mg_L",
                               "Temperature_C" ,
                               "Chlorophyll_ug_L" ,
                               "DateTime")),
      
      selectInput("var3", "请选择一个Y变量",
                  choices <- c("pH" ,
                               "ODO_mg_L",
                               "Temperature_C" ,
                               "Chlorophyll_ug_L" ))
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      plotOutput("pHPlot"),
      plotOutput("ODOPlot"),
      plotOutput("TempPlot"),
      plotOutput("ChlorophyllPlot")
      
      
      ###function2
      
      
      
      
      ######
      
      
    )
  )
))