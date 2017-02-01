#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
    
    data <- diamonds
    
   output$group1ui <- renderUI({
        switch(input$factor,
              "Carat" = textInput("caratrange","What is the Carat of your diamond? (between 0.2 and 5.01)",value=3.0),
              "Cut" = radioButtons("cut","What is the cut of your diamond?",
                                   choices = c("Fair","Good","Very Good","Premium","Ideal")),
              "Colour" = radioButtons("color","What is the colour of your diamond?",
                                      choices = c("D","E","F","G","H","I","J")),
              "Clarity" = radioButtons("clarity","What is the clarity of your diamond?",
                                       choices = c("IF","VS1","VS2","VVS1","VVS2"))
         )
   })
   
 
  output$FullPlot <- renderPlot({
      if(input$factor == "Carat"){
          dat <- as.data.frame(diamonds[,c("carat","price"),])
          subcarat <- dat[which(dat$carat==input$carat),]
          maxV <- max(subcarat$price)
          minV <- max(subcarat$price)
          meanV <- mean(subcarat$price)
          plot(dat[,1],dat[,2],
               ylab="Singapore dollars $",xlab="carats",
               xlim=c(0,5.5),ylim=c(300,19000))
      }
      if(input$factor == "Cut"){
          dat <- as.data.frame(diamonds[,c("cut","price"),])
          subcut <- dat[which(dat$cut==input$cut),]
          maxV <- max(subcut$price)
          minV <- max(subcut$price)
          meanV <- mean(subcut$price)
          plot(dat[,1],dat[,2],
               ylab="Singapore dollars $",xlab="cut")
      }
      if(input$factor == "Colour"){
          dat <- as.data.frame(diamonds[,c("color","price"),])
          subcol <- dat[which(dat$color==input$color),]
          maxV <- max(subcol$price)
          minV <- max(subcol$price)
          meanV <- mean(subcol$price)
          plot(dat[,1],dat[,2],
               ylab="Singapore dollars $",xlab="colour")
      }
      if(input$factor == "Clarity"){
          dat <- as.data.frame(diamonds[,c("clarity","price"),])
          subclarity <- dat[which(dat$clarity==input$clarity),]
          maxV <- max(subclarity$price)
          minV <- max(subclarity$price)
          meanV <- mean(subclarity$price)
          plot(dat[,1],dat[,2],
               ylab="Singapore dollars $",xlab="clarity")
      }
      
      
  }) 
  
  output$value <- renderText({
      if(input$factor == "Carat"){
          dat <- as.data.frame(diamonds[,c("carat","price"),])
          subcarat <- dat[which(dat$carat>(as.numeric(input$caratrange)-0.5) & dat$carat<(as.numeric(input$caratrange)+0.5)),] 
          maxV <- max(subcarat$price)   
          minV <- min(subcarat$price) 
          meanV <- mean(subcarat$price) 
      }  
      if(input$factor == "Cut"){
          dat <- as.data.frame(diamonds[,c("cut","price"),])
          subcut <- dat[which(dat$cut==input$cut),]
          maxV <- max(subcut$price)
          minV <- min(subcut$price)
          meanV <- mean(subcut$price)
      }
      if(input$factor == "Colour"){
          dat <- as.data.frame(diamonds[,c("color","price"),])
          subcol <- dat[which(dat$color==input$color),]
          maxV <- max(subcol$price)
          minV <- min(subcol$price)
          meanV <- mean(subcol$price)
      }
      if(input$factor == "Clarity"){
          dat <- as.data.frame(diamonds[,c("clarity","price"),])
          subclarity <- dat[which(dat$clarity==input$clarity),]
          maxV <- max(subclarity$price)
          minV <- min(subclarity$price)
          meanV <- mean(subclarity$price)
      }
      

      paste0("The range of prices for your dimaond is $", minV, "-$", maxV,". The mean price is $", round(meanV,0),".")
  })
  
  
  
})
