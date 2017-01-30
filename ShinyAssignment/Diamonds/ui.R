#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict the price of your diamond"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        radioButtons("factor",label="What do you know about your diamond?",
                     choices=c("Carat","colour","clarity")),
        uiOutput("group1ui")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("FullPlot"),
       textOutput("value")
    )
  )
))
