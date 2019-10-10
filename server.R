#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# server.R
#
function(input, output) {
  output$outputSearchText <- renderText({
    point <- geocode(input$inputSearchText)
    paste(c("You searched for:", 
          input$inputSearchText,
          "(",
          point,
          ")"))
  })

  output$outputMap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$CartoDB.Positron,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = geocode(input$inputSearchText))
  })

}
