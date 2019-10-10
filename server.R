#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# server.R
#
library(shiny)

function(input, output) {
  output$outputSearchText <- renderText({
    paste("You searched for: ", input$inputSearchText)
  })
}
