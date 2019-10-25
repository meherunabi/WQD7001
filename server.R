#
# Taken from https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# server.R
#
getPoint <- function(text) {
  message(text)
  if(0 < str_length(trimws(text))) {
    message('Using Google')
    point <- geocode(text)
  }
  else {
    message('Using ipApi')
    ipApiJSON <- fromJSON('http://ip-api.com/json/')
    point <- as.data.frame(ipApiJSON)[c('lat', 'lon')]
  }
  return(point)
}

function(input, output) {
  output$outputTextSearch <- renderText({
    message(input$inputTextSearch)
    point <- getPoint(input$inputTextSearch)
    paste(c("You searched for:", 
          input$inputTextSearch,
          "(",
          point,
          ")"))
  })

  output$outputMap <- renderLeaflet({
    searchIcon <- makeIcon(
      iconUrl = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|e85141&chf=a,s,ee00FFFF',
      # iconWidth = 38, iconHeight = 95,
      # iconAnchorX = 22, iconAnchorY = 94,
      # shadowUrl = "http://leafletjs.com/examples/custom-icons/leaf-shadow.png",
      # shadowWidth = 50, shadowHeight = 64,
      # shadowAnchorX = 4, shadowAnchorY = 62
    )
    point <- getPoint(input$inputTextSearch)
    leaflet() %>%
      addProviderTiles(providers$CartoDB.Positron,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(icon = searchIcon,
                 lng = point$lon,
                 lat = point$lat)
  })

  output$outputDataTableYelp <- renderDataTable({
    mapBounds <- input$outputMap_bounds
    print('means:')
    lonMean <- mean(c(mapBounds$west, mapBounds$east)) %>% print()
    latMean <- mean(c(mapBounds$north, mapBounds$south)) %>% print()
    print('mapBounds:')
    print(mapBounds$north)
    print(mapBounds$south)
    print(mapBounds$west)
    print(mapBounds$east)
    
    locations <- yelpJSON %>%
      filter(between(coordinates.longitude, mapBounds$west, mapBounds$east)) %>%
      filter(between(coordinates.latitude, mapBounds$south, mapBounds$north)) %>%
      mutate(distance = sqrt((abs(coordinates.longitude - lonMean)^2)
                             + (abs(coordinates.latitude - latMean)^2))) %>%
      select(name, 
             distance,
             url,
             display_phone,
             price,
             coordinates.longitude, coordinates.latitude) %>%
      distinct() %>%
      top_n(-50, distance)

    yelpIcon <- makeIcon(
      iconUrl = 'https://s3-media1.fl.yelpcdn.com/assets/2/www/img/a6bbc59c7458/ico/favicon-16x16.ico',
    )

    leafletProxy("outputMap", data = locations) %>%
      clearMarkers() %>%
      # addTiles() %>%
      addMarkers(icon = yelpIcon,
                 ~coordinates.longitude,
                 ~coordinates.latitude,
                 popup = ~as.character(name),
                 label = ~as.character(name))
    glimpse(locations)
    locations %>%
      select(name,
             # distance,
             # coordinates.longitude,
             # coordinates.latitude,
             display_phone,
             price)
  },
  options = list(
    # See https://datatables.net/reference/option/
    info = FALSE,
    lengthChange = FALSE,
    ordering= FALSE,
    pageLength = 5,
    paging = T,
    searching = FALSE
  ),
  rownames = F
  )
}
