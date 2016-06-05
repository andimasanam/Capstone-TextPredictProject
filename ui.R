library(shiny)
shinyUI(fluidPage(
    titlePanel("Coursera Capstone Text Prediction Application"),
    fluidRow("Please give 10-15 seconds for the app to load in the background."),
    hr(),
    fluidRow("In the space"),
    fluidRow("1. Type a sentence"),
    fluidRow("2. Press Submit"), 
    fluidRow("Wait for few seconds... and then you will see a few words that are likely to come next!"),
    hr(),
    textInput('sentenceInputVar', 'Input Sentence here:'),
    actionButton('submitButton', 'Submit'),
    fluidRow('(Example: "I want to go" or "She used to")'),
    verbatimTextOutput("oWordPredictions"),
    
    hr(),
)
)
