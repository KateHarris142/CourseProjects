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
  
  helpText('This App uses the R diamonds dataset to look at the ranges of carat, colour, clarity and cut of diamonds.
           To use, select what you know about your diamond, for exxample the carat. 
           Below will appear a new input where you can add/select the availble options.
           The plot will show all the spread of all the data for that variable, while the text will give you the 
           range and mean for your selected input.
           From this you can see how expensive (and the range) you would expect your diamond to be based on the 
           information you have, and also the ranges for different diamonds.'),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        radioButtons("factor",label="What do you know about your diamond?",
                     choices=c("Carat","Colour","Clarity","Cut")),
        uiOutput("group1ui")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("FullPlot"),
       textOutput("value")
    )
  )
))
