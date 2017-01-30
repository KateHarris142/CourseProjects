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
  titlePanel("Titanic Survival Rates"),
  
  helpText('This App looks at the survival rate of different type of passengers on the Titanic. \n 
           You can select to look at gener, age or passanger class.'),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        radioButtons("factor","Factor to plot",choices = c("Sex","PClass","Age"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
