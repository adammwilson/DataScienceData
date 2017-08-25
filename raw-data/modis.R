# MODIS Data
#
library(MODISTools)
library(sp)

loc=rbind.data.frame(
  list("UB Spine",43.000753, -78.788195))
colnames(loc)=c("loc","lat","long")
coordinates(loc)=cbind(loc$long,loc$lat)

## Available dates
modis_dates=GetDates(Product = "MOD11A2", Lat = loc$lat[1], Long = loc$long[1])

devtools::use_data(modis_dates)

lstdir=file.path("inst/extdata/modis/lst")
if(!file.exists(lstdir)) dir.create(lstdir, recursive=T)

lcdir=file.path("inst/extdata/modis/lc")
if(!file.exists(lcdir)) dir.create(lcdir)

### Get Land Surface Temperature Data
MODISSubsets(LoadDat = loc,
             Products = c("MOD11A2"),
             Bands = c( "LST_Day_1km", "QC_Day"),
             Size = c(10,10),
             SaveDir=lstdir,
             StartDate=T)

### Get LULC
MODISSubsets(LoadDat = loc,
             Products = c("MCD12Q1"),
             Bands = c( "Land_Cover_Type_1"),
             Size = c(10,10),
             SaveDir=lcdir,
             StartDate=T)

## Convert LST Data
MODISGrid(Dir = lstdir,
          DirName = "modgrid",
          SubDir = TRUE,
          NoDataValues=
            list("MOD11A2" = c("LST_Day_1km" = 0,
                               "QC_Day" = -1)))

## Convert LandCover Data
MODISGrid(Dir = lcdir,
          DirName = "modgrid",
          SubDir = TRUE,
          NoDataValues=
            list("MCD12Q1" = c("Land_Cover_Type_1" = 255)))
