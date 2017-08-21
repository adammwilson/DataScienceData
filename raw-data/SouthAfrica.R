
library(raster)
library(devtools)
library(rgeos)
library(dplyr)

za=getData('GADM', country='ZAF', level=1, path=tempdir())
use_data(za, overwrite=T)

