##
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
    titlePanel("Capstone Project: Predicting the next word"),
    
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Enter a word/sentence"),
            textInput("input_text", "Sentence:",value = "name"),
            h5('Instructions'),
            helpText("This application predict the next possible word for that word you input."),
            helpText("This uses NLP to build a model and the data used is the text extracted from blogs, news and twitter provided by SwiftKey.")
        ),
        
            mainPanel(
            h2("Predicted Next word"),
            verbatimTextOutput("..."),
            h3(strong(code(textOutput('next_word')))),
            br(),
            br(),
            h4(tags$b('Bi-gram:')),
            textOutput('bigram'),
            br(),
            h4(tags$b('Tri-gram:')),
            textOutput('trigram'),
            br(),
            h4(tags$b('Quad-gram:')),
            textOutput('quagram'),
        )
    )
))