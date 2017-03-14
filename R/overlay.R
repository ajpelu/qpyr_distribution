# Title: Get pixels of Q. pyrenaica fores
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
mymachine <- '/Users/ajpelu/' 
# mymachine <- '/Users/ajpeluLap/'
di <- paste0(mymachine, 'Dropbox/phd/phd_repos/qpyr_distribution/')
# ------ 

# Read centroid 
centroid <- rgdal::readOGR(dsn=paste0(mymachine, '/Dropbox/carto_public/iv_malla_modis/'), 
                           layer = 'iv_malla_modis_sn', verbose = TRUE, encoding = "UTF-8")


# Read spatial distribution
qp <- rgdal::readOGR(dsn=paste0(di, 'data_raw/geoinfo/'), 
                     layer = 'q_pyr_sn_4326', verbose = TRUE, encoding = "UTF-8")

centroid_qp <- centroid[qp,]
plot(centroid_qp)
nrow(centroid_qp@data)


