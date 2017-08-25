#' Sample dates retrieved from the MODIS API with MODISTools package
#'
#' MODIS date codes: `.A2006001` - Julian Date of Acquisition (A-YYYYDDD)
#' To  Convert to a _proper_ date: 1)  Drop the "`A`" and 2)  Specify date format with julian day `[1,365]`
#'
#' @format character vector of dates in the MODIS format.
#'
#' @source \url{http://www.worldclim.org/bioclim}
"modis_dates"
