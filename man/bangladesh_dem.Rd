% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bangladesh_dem.R
\docType{data}
\name{bangladesh_dem}
\alias{bangladesh_dem}
\title{Elevation data for Bangladesh}
\format{A raster layer}
\source{
\url{http://srtm.csi.cgiar.org/SRT-ZIP/SRTM_V41/SRTM_Data_GeoTiff/srtm_54_07.ZIP}
}
\usage{
bangladesh_dem
}
\description{
Digital elevation model for the country of Bangladesh aquired using \code{raster::getData()} for the country boundaries and four SRTM tiles.  These were merged and then cropped and masked to the country boundaries.
}
\keyword{datasets}
