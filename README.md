# ozpowermap

A map of where to move in Australia to ensure your voice is heard.

See this project online at [oz-info.github.io/ozpowermap](https://oz-info.github.io/ozpowermap/index.html)


## Background info 

A project started by [Dan MacKinlay](https://danmackinlay.name), but other are welcome to join us.

## Thanks

This site is built upon work, tutorials, inspiration and/or advice from many people we offer them thanks to their inspiration.

* [Jeremy Forbes](https://github.com/jforbes14/) and the [eechidna contributors](https://github.com/jforbes14/eechidna/graphs/contributors)
* [Ben Raue](https://www.tallyroom.com.au/) 
* [Timothy Lin](https://www.timlrx.com/blog/using-leaflet-in-r-tutorial)
* [Peter Ellis](http://freerangestats.info/)
* [Dr Kevin Bonham](https://kevinbonham.blogspot.com/)

However, all mistakes made here and opinions expressed here are the responsibility of the ozpowermap project contributors, not these muses.

## How to contribute

The easiest way to get started here is to install [RStudio](https://www.rstudio.com/products/rstudio/) which is the statistics system we used to make this.

Next, fork the [source code](https://github.com/oz-info/ozpowermap) for this project and download it.

Now, inside RStudio, you should be able to get all the libraries you need installed by running 

```r
renv::restore()
```

Download the large data files by using 

```r
source('setup.R')
```

Your OS might need extra the geography libraries installed:

```bash
## Ubuntu et al
sudo apt install libgeos-dev libudunits2-dev libgdal1-dev
## macos
brew install # some stuff I can't remember right now. GDAL?
## windows 
# dunno
```

## Useful resources

### R

* [Creating GeoJSON out of Shapefile in R](https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d)
* [Chapter 8 Making maps with R | Geocomputation with R](https://geocompr.robinlovelace.net/adv-map.html)
* [Spatial Data Science](https://keen-swartz-3146c4.netlify.app/)
* [RMarkdown’s site generator](https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html) which is how this site is hosted on github

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
