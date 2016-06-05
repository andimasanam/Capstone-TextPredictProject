library('shiny')
library('shinyjs')

# Define UI for application that draws a histogram
ui = fluidPage(
  shinyjs::useShinyjs(),
  shinyjs::inlineCSS(list(.big = "font-size: 2em")),
  div(id = "myapp",
      h2("Capstone Data Science Text Prediction Project"),
      textInput("Input", "Text Input :", ""),
      p('Type up to 2 words in sequence with space as system will auto detect the word(s) and suggest you the best predictive next word in table format.'),
      p("Timestamp: ",
        span(id = "time", date()),
        a(id = "update", "Update", href = "#")
      ),
      actionButton("reset", "Reset form")
  ),
  mainPanel(
    verbatimTextOutput('text1'),
    verbatimTextOutput('text2'),
    br(),
    div(id = "Predict", p('The best match next predictive word is :', htmlOutput('text3'))),
    hr(),
    DT::dataTableOutput('table')
  )
)
