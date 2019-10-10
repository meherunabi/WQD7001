#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# server.R
#
function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}
