library(shiny)
library(leaflet)
library(ggmap)
library(jsonlite)
library(stringr)
library(dplyr)
library(DT)

register_google(key = 'AIzaSyCbXd49uBnn8cEXW08r1JILAXmsV-aavkI')

# setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

yelpJSON <- fromJSON('data/yelp_download.json')