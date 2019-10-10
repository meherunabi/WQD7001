#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# ui.R
#
fluidPage(
  titlePanel("WQD7001 - Group project"),
  textInput(inputId = "inputSearchText", label = "Search location", width = "100%", value = "Faculty of Computer Science, University of Malaya"),
  textOutput(outputId = "outputSearchText"),
  leafletOutput("outputMap")
)
