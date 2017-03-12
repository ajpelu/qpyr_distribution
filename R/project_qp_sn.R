# Title: Set projection of the Q. pyrenaica forests of Sierra Nevada
# date: nov 2016
# Author: Pérez-Luque AJ @ajpelu 

# ------ 
# Load packages
library('rgdal')
library('sp')
library('raster')
# ------ 

# ------
# Set dir 
# mymachine <- '/Users/ajpelu/' 
mymachine <- '/Users/ajpeluLap/'
di <- paste0(mymachine, 'Dropbox/phd/phd_repos/qpyr_distribution/')
# ------ 

# Read spatial distribution
qp <- rgdal::readOGR(dsn=paste0(di, 'data_raw/geoinfo/'), 
                        layer = 'roble_sin_proj', verbose = TRUE)

# Set projection (ED50 )
proj4string(qp) <- CRS("+init=epsg:23030")

# Reproject 
# to 4326 
code4326 <- "+init=epsg:4326"
qp4326 <- spTransform(qp, CRS(code4326))


# Export shape  
writeOGR()

writeOGR(obj = qp4326, dsn=paste0(di, 'data_raw/geoinfo/'), 
         layer = 'q_pyr_sn_4326', driver = 'ESRI Shapefile')


