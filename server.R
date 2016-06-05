library(shiny)
library(data.table)
# setwd(directory)
dictlist <- readRDS("dictlist.rds")
source("findNextWord.R")

shinyServer(
    function(input, output) {
        ## Various output variables
        ## Near the VERIFY button: text that tells you that you are unverified, or that you need to double-check your credentials
        output$oWordPredictions <- renderText({
            input$submitButton
            results <- isolate(paste(
                unlist(lapply(pkn.findNextWord(string = input$sentenceInputVar, 
                                                     dictlist = dictlist, 
                                                     ncandidates = 50, 
                                                     min_cand_freq = 2)$Candidate[1:5],
                              function(x) paste0("[", x, "]")
                              )
                       )
                ))
        })
    })
