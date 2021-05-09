# ozpowermap

A map of where to move in Australia to ensure your voice is heard.

A project of [Dan MacKinlay](https://danmackinlay.name).

[Ben Raue](https://www.tallyroom.com.au/) advises:

>The election results data published by the AEC is already pretty good.
>It’s tidy and easily interconnectable with unique IDs.
>
>Unlike the state and local election results which is why I started [my own collection](https://www.tallyroom.com.au/data) of those results in a tidy format.
>
>All the results websites are available from [the AEC website](https://results.aec.gov.au/) then click through to downloads.
>In some cases datasets are broken up by geography (by state or electorate) but it’s trivial to merge them back together in R.
>
>The House of Reps downloads for 2019 are [here](https://results.aec.gov.au/24310/Website/HouseDownloadsMenu-24310-Csv.htm).


## TODO

* Persuade [microburbs](https://www.microburbs.com.au/) to integrate our data.

## Installation

For doing data analysis you need all the geography libraries installed

```bash
# Ubuntu et al
sudo apt install libgeos-dev libudunits2-dev libgdal1-dev
# macos
brew install # some stuff I can't remember right now
# windows 
## dunno
```

## state

* [eechidna/getting-ozShapefiles.Rmd at master · jforbes14/eechidna](https://github.com/jforbes14/eechidna/blob/master/vignettes/getting-ozShapefiles.Rmd)
* [eechidna/vignettes at master · jforbes14/eechidna](https://github.com/jforbes14/eechidna/tree/master/vignettes)
* [eechidna/plotting-electorates.Rmd at master · jforbes14/eechidna](https://github.com/jforbes14/eechidna/blob/master/vignettes/plotting-electorates.Rmd)
* [Tips for reading spatial files into R with rgdal | Technical Tidbits From Spatial Analysis & Data Science](http://zevross.com/blog/2016/01/13/tips-for-reading-spatial-files-into-r-with-rgdal/)
* [Creating GeoJSON out of Shapefile in R | by Kan Nishida | learn data science](https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d)
* [More than you ever wanted to know about GeoJSON - macwright.com](https://macwright.com/2015/03/23/geojson-second-bite.html)
* [Leaflet - a JavaScript library for interactive maps](https://leafletjs.com/index.html)
* [Using GeoJSON with Leaflet - Leaflet - a JavaScript library for interactive maps](https://leafletjs.com/examples/geojson/)
* [Leaflet for R - Shapes](https://rstudio.github.io/leaflet/shapes.html)
* [Leaflet for R - Markers](https://rstudio.github.io/leaflet/markers.html)
* [Leaflet for R - Popups and Labels](https://rstudio.github.io/leaflet/popups.html)
* [Layer Groups and Layers Control - Leaflet - a JavaScript library for interactive maps](https://leafletjs.com/examples/layers-control/)
* [Data Layer Google Maps JavaScript API](https://developers.google.com/maps/documentation/javascript/datalayer#style_geojson_data)
* [Credentials – APIs & Services – Google Cloud Platform](https://console.cloud.google.com/apis/credentials?project=livingthing-academic&pli=1)
* [eechidna/getting-ozShapefiles.Rmd at master · jforbes14/eechidna](https://github.com/jforbes14/eechidna/blob/master/vignettes/getting-ozShapefiles.Rmd)
* [Using Leaflet in R - Tutorial – Quasilinear Musings](https://www.timlrx.com/blog/using-leaflet-in-r-tutorial)
* [Getting Oz Electorate shapefiles into shape • eechidna](https://jforbes14.github.io/eechidna/articles/getting-ozShapefiles.html)
* [Examining the Changes in Religious Beliefs - Part 2 – Quasilinear Musings](https://www.timlrx.com/blog/examining-the-changes-in-religious-beliefs-part-2#fn-3)
* [An Introduction to Exploring Election and Census Highly Informative Data Nationally for Australia • eechidna](https://jforbes14.github.io/eechidna/articles/eechidna-intro.html)
* [Exploring the Election data: a case study of 2016 • eechidna](https://jforbes14.github.io/eechidna/articles/exploring-election-data.html)
* [Exploring the Census data: A case study of 2016 • eechidna](https://jforbes14.github.io/eechidna/articles/exploring-census-data.html)
* [Mapping Australia's Electorates • eechidna](https://jforbes14.github.io/eechidna/articles/plotting-electorates.html)
* [2 tmap | Making Maps with R](https://bookdown.org/nicohahn/making_maps_with_r5/docs/tmap.html#interactive-maps-with-tmap)
* [6 leaflet | Making Maps with R](https://bookdown.org/nicohahn/making_maps_with_r5/docs/leaflet.html)
* [2 tmap | Making Maps with R](https://bookdown.org/nicohahn/making_maps_with_r5/docs/tmap.html#interactive-maps-with-tmap)
* [1. Simple Features for R • sf](https://r-spatial.github.io/sf/articles/sf1.html#sf-objects-with-simple-features-1)
* [Geocomputation with R](https://geocompr.robinlovelace.net/)
* [Chapter 3 Attribute data operations | Geocomputation with R](https://geocompr.robinlovelace.net/attr.html)
* [Spatial Data Science](https://keen-swartz-3146c4.netlify.app/)
* [st_as_sf faithfully uses "+proj=longlat +ellps=WGS84" instead of conversion to "+proj=longlat +datum=WGS84" · Issue #363 · r-spatial/sf](https://github.com/r-spatial/sf/issues/363)
* [Coordinate Systems in R | Intro to GIS and Spatial Analysis](https://mgimond.github.io/Spatial/coordinate-systems-in-r.html)
* [Reading and writing spatial data in R | Intro to GIS and Spatial Analysis](https://mgimond.github.io/Spatial/app1-1.html)
* [Cartographic projection — PROJ 8.0.0 documentation](https://proj.org/usage/projections.html)
* [Spatial Reference List -- Spatial Reference](https://spatialreference.org/ref/)
* [Projection problems with leaflet - General - RStudio Community](https://community.rstudio.com/t/projection-problems-with-leaflet/27747/2)
