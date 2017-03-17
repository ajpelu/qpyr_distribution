### Distribución Espacial Robledales Sierra Nevada

* El shape de distribución espacial de robledales de SN, viene del mapa de ecosistemas de SN y de su corrección con el proyecto de Mapa de Vegetación de Sierra Nevada (Irene)

* La projection del shape es ED1950 (epsg: 23030), pero no está definida en si dentro del shape. Por ello hay que establecersela (`proj4string(qp) <- CRS("+init=epsg:23030")`).

* Se ha generado un shape con la proyección epsg:4326 y se ha exportado como: `./data_raw/geoinfo/q_pyr_sn_4326.shp` 


#### Pixeles de MODIS 
* Hasta ahora estabamos utilizando los pixeles de MODIS que cubrian los robledales. Utilizamos la malla que usamos para el ms de ontologías, pero lo hemos revisado y hemos generado una nueva malla de puntos, llevando a cabo consultas espaciales. 

* La capa generada se llama `./raw_data/geoinfo/iv_malla_modis_qp_centroid.shp` y/o `./raw_data/geoinfo/iv_malla_modis_qp_pol.shp` 

* Por otro lado hemos generado un csv a partir esta capa y la hemos guardado en `./data/iv_malla_modis_qp_centroid.csv`
