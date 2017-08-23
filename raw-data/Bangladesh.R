#Get Bangladesh Population data
library(raster)
library(dplyr)
library(rgeos)
library(devtools)

datadir=tempdir()

bgd=getData('GADM', country='BGD', level=0,path = datadir)
bangladesh=bgd

use_data(bangladesh)

## Get DEM
bgdc=gCentroid(bgd)%>%coordinates()
dem1=getData("SRTM",lat=bgdc[2],lon=bgdc[1],path=datadir)
dem2=getData("SRTM",lat=23.7,lon=85,path=datadir)
dem3=getData("SRTM",lat=26,lon=85,path=datadir)
dem4=getData("SRTM",lat=26,lon=92,path=datadir)

dem=merge(dem1,dem2, dem3, dem4)

plot(dem)
bgd%>%
  gSimplify(0.01)%>%
  plot(add=T)

bangladesh_dem=crop(dem,bgd,overwrite=T)%>%
  mask(bgd)%>%
  readAll()

bangladesh_dem=readAll(bangladesh_dem)

# Gridded Population of the World

#Data _not_ available for direct download (e.g. `download.file()`)

#* Log into SEDAC with an Earth Data Account [http://sedac.ciesin.columbia.edu](http://sedac.ciesin.columbia.edu)
#* Download Population Density Grid for 2015

### Crop and mask to region
pop_global=raster("~/Downloads/gpw-v4-population-density-2015/gpw-v4-population-density_2015.tif")

bangladesh_population=pop_global%>%
  crop(bgd,overwrite=T)%>%
  mask(bgd)%>%
  readAll()

use_data(bangladesh_dem, overwrite=T)
use_data(bangladesh_population, overwrite=T)
