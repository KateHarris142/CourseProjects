
library(shiny)
data <- read.csv("Titanic.csv")

shinyServer(function(input, output) {
    survived <- data[which(data$Survived == 1),]
    died <- data[which(data$Survived == 0),]
    selectedData <- reactive({
        data[, c(input$factor, "Survived")]
        })
    
    
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    if(input$factor == "PClass"){
        dat <- data[which(data$PClass != "*"),]
        barplot(table(dat$Survived,dat$PClass),
                beside=TRUE,
                col = c("black","green3"),
                legend = levels(unique(as.factor(dat$Survived))),
                legend.text	= c("Died","Survived")
                )
    }else{
        if(input$factor == "Sex"){
            barplot(table(dat$Survived,dat$Sex),
                beside=TRUE,
                col = c("black","green3"),
                legend = levels(unique(as.factor(dat$Survived))),
                legend.text	= c("Died","Survived")
                )
                
        }else{
                
                #create age brackets
                barplot(table(dat$Survived,dat$Age),
                                    beside=TRUE,
                                    col = c("black","green3"),
                                    legend = levels(unique(as.factor(dat$Survived))),
                                    legend.text	= c("Died","Survived")  
                                    )
            }
        }
    })
  
})
