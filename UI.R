#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# ui.R
#
library(shiny)

fluidPage(
  titlePanel("WQD7001 - Group project"),
  textInput(inputId = "inputSearchText", label = "Search location", width = "100%"),
  textOutput(outputId = "outputSearchText")
)
