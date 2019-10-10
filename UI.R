#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# ui.R
#
fluidPage(
  numericInput(inputId = "n", "Sample size", value = 25),
  plotOutput(outputId = "hist")
)
