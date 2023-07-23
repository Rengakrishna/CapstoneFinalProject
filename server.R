#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
setwd("C:/Users/rkrishnaramanujam/Documents/final")
library(shiny)
source("Predict.R")



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$next_word <- renderText({
        word <- as.character(input$input_text)
        paste0(input$input_text," ",predictWord(word))
    })
    
    output$bigram <- renderText({
        word <- as.character(input$input_text)
        predictWord(word,2)
    })
    
    output$trigram <- renderText({
        word <- as.character(input$input_text)
        predictWord(word,3)
    })
    
    output$quagram <- renderText({
        word <- as.character(input$input_text)
        predictWord(word,4)
    })
    
})
