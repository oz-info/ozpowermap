# ozpowermap

A map of where to move in Australia to ensure your voice is heard.

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

A project started by [Dan MacKinlay](https://danmackinlay.name).

## Thanks

This tutorial is built upon excellent work, tutorials, and advice from several kindly people:

* [Jeremy Forbes](https://github.com/jforbes14/)
* [Ben Raue](https://www.tallyroom.com.au/) 
* [Timothy Lin](https://www.timlrx.com/blog/using-leaflet-in-r-tutorial)

## TODO

* Persuade [microburbs](https://www.microburbs.com.au/) to integrate our data.

## Installation

For doing data analysis you need all the geography libraries installed

```bash
# Ubuntu et al
sudo apt install libgeos-dev libudunits2-dev libgdal1-dev
# macos
brew install # some stuff I can't remember right now. GDAL?
# windows 
## dunno
```

## Useful resources

### R

* [Creating GeoJSON out of Shapefile in R](https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d)
* [Chapter 8 Making maps with R | Geocomputation with R](https://geocompr.robinlovelace.net/adv-map.html)
* [Spatial Data Science](https://keen-swartz-3146c4.netlify.app/)

### Leaflet

* [Leaflet - a JavaScript library for interactive maps](https://leafletjs.com/index.html)
* [Using GeoJSON with Leaflet - Leaflet - a JavaScript library for interactive maps](https://leafletjs.com/examples/geojson/)

### Google maps

* [Data Layer Google Maps JavaScript API](https://developers.google.com/maps/documentation/javascript/datalayer#style_geojson_data)

### eechinda

This is the library which wraps up the Census and electoral information for Australia nicely.

* [eechidna/getting-ozShapefiles.Rmd](https://github.com/jforbes14/eechidna/blob/master/vignettes/getting-ozShapefiles.Rmd)
* [eechidna/vignettes](https://github.com/jforbes14/eechidna/tree/master/vignettes)
* [eechidna/plotting-electorates.Rmd](https://github.com/jforbes14/eechidna/blob/master/vignettes/plotting-electorates.Rmd)
* [An Introduction to Exploring Election and Census Highly Informative Data Nationally for Australia • eechidna](https://jforbes14.github.io/eechidna/articles/eechidna-intro.html)
* [Exploring the Election data: a case study of 2016 • eechidna](https://jforbes14.github.io/eechidna/articles/exploring-election-data.html)
* [Exploring the Census data: A case study of 2016 • eechidna](https://jforbes14.github.io/eechidna/articles/exploring-census-data.html)
* [Mapping Australia's Electorates • eechidna](https://jforbes14.github.io/eechidna/articles/plotting-electorates.html)
