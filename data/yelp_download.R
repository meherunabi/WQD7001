library(httr)
library(jsonlite)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

categoriesJSON <- fromJSON('https://www.yelp.com/developers/documentation/v3/all_category_list/categories.json')

host <-  'https://api.yelp.com'
path <-  '/v3/businesses/search'
headers <- add_headers(Authorization = 'Bearer Jzqxl6NduEw6GGeNxCgrQCBbQoRNpzW7A3PCVsOF7vxqyMc4SpfXnja_9Nqk4jNQh0WU-SIx_lUzAvT1ET1dYRIQl84BbVbEQar7iQo6krCoRXGHpgrWm-s8aCOwXXYx')
limit <- 50
seq <- seq(from = 0, to = 1000 - limit, by = limit)
businesses <- data.frame()

for(category in categoriesJSON$alias) {
  for(offset in seq) {
    query <- list(location = 'Kuala%20Lumpur',
                  categories = category,
                  limit = limit,
                  offset = offset,
                  radius = 40000)
    response <- GET(host, path = path, query = query, headers)
    body <- content(response, "text", encoding = "UTF-8")
    json <- fromJSON(body, flatten = TRUE)
    if(0 == length(json$businesses)) {
      break
    }
    businesses <- plyr::rbind.fill(businesses, data.frame(json$businesses))
  }
}
jsonlite::write_json(businesses, path = './yelp_download.json')
