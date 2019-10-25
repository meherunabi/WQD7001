#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# ui.R
#
fluidPage(
  titlePanel("WQD7001 - Group project"),
  textInput(inputId = "inputTextSearch", label = "Search location", width = "100%", value = ""),
  textOutput(outputId = "outputTextSearch"),
  leafletOutput("outputMap"),
  dataTableOutput(outputId = "outputDataTableYelp")
)
