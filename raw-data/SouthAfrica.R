
library(raster)
library(devtools)
library(rgeos)
library(dplyr)

southAfrica=getData('GADM', country='ZAF', level=1, path=tempdir())
use_data(southAfrica, overwrite=T)

