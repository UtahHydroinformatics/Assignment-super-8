#
#
# This is the Main CODE of ASSIGNMENT 8
#
#
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
server <- function(input, output) {
  
  ##########     function 1
  database <- read.csv('data/FormattedBuoyData.csv')
  database$DateTime <- as.factor(database$DateTime)
  database$SiteName <- as.factor(database$SiteName)

  output$pHPlot = renderPlot({
    ggplot(data=database[database$SiteName==input$var,], aes_string(x=input$var2, y=input$var3))+
      
      geom_point(color="gray")+geom_smooth()
    
  })
  
  
  output$ODOPlot = renderPlot({
    ggplot(data=database[database$SiteName==input$var,], aes(x=Temperature_C, y=ODO_mg_L))+
      
      geom_point(color="gray")+geom_smooth()+ylab("ODO")
  })
  
  
  
  output$TempPlot = renderPlot({
    ggplot(data=database[database$SiteName==input$var,], aes(x=DateTime, y=Temperature_C))+
      
      geom_point()+geom_smooth()+ylab("Temperature")
  })
  
  
  
  
  #############
  
  
  output$ChlorophyllPlot = renderPlot({
    ggplot(data=database[database$SiteName==input$var,], aes(x=Temperature_C, y=pH))+
      
      geom_point(color="red")+geom_smooth()+ylab("Chlorophyll")
  })
  
  
  # ########## functon 2

  datasetInput = reactive({
    switch(database,
           "pH" = pH,
           "Temp" = Temperature_C,
           "Chlorophyll" = Chlorophyll_ug_L,
           "ODO" = ODO_mg_L)




  })


  output$caption <- renderText({
    input$caption
  })
  # 
  ######################################
  
  
  
  
  
}





