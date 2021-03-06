#Load packages
library(sf)
library(osmdata)
library(rnaturalearth)
library(raster)
library(dplyr)
library(ggplot2)

df <- read.csv2("data/social-housing-paris/logements-sociaux-finances-a-paris.csv",
                stringsAsFactors = FALSE) %>% 
  janitor::clean_names()
df_sf <- sf::read_sf("data/social-housing-paris/logements-sociaux-finances-a-paris.geojson")

paris <- raster::getData(name = "GADM", country = "FRA", level = 3) %>% 
  sf::st_as_sf() %>% 
  filter(NAME_1 == "Île-de-France" & NAME_2 == "Paris")

ggplot()+
  geom_sf(data = paris) +
  geom_sf(data = df_sf)
