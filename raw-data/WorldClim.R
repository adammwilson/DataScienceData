# Worldclim temperature
#
#

worldclim=getData('worldclim', var='bio', res=10, path=tempdir())%>%
  readAll()

use_data(worldclim, overwrite=T)
