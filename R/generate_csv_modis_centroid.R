# Title: Generate csv of centroids MODIS 
# date: nov 2016
# Author: Pérez-Luque AJ @ajpelu 

# ------ 
# Load packages
library('rgdal')
library('sp')
library('tidyverse')
# ------ 

# ------
# Set dir 
mymachine <- '/Users/ajpelu/' 
# mymachine <- '/Users/ajpeluLap/'
di <- paste0(mymachine, 'Dropbox/phd/phd_repos/qpyr_distribution/')
# ------ 

# Read modis iv pixels (centroid)
modis_iv <- rgdal::readOGR(dsn=paste0(di, '/data_raw/geoinfo/'),
                           layer = 'iv_malla_modis_qp_centroid', verbose = FALSE, encoding = "UTF-8")
# Get coordinates 
iv_modis_coord_qp <- as.data.frame(cbind(coordinates(modis_iv), modis_iv@data))

# Rename 
names(iv_modis_coord_qp) <- c('longitude', 'latitude', 'iv_malla_modi_id', 'lng', 'lat', 'pop')

# Format data (factor as numeric )
iv_modis_coord_qp$iv_malla_modi_id <- as.numeric(levels(iv_modis_coord_qp$iv_malla_modi_id))
iv_modis_coord_qp$pop <- unclass(iv_modis_coord_qp$pop) %>% as.numeric

# Select columns of interest 
iv_modis_coord_qp <- iv_modis_coord_qp %>% 
  select(iv_malla_modi_id, longitude, latitude, pop)

# Export 
write.csv(iv_modis_coord_qp, file=paste0(di, '/data/iv_malla_modis_qp_centroid.csv'), row.names = FALSE)

