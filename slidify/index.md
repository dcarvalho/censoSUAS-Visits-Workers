---
title       : Exploring data from Censo SUAS
subtitle    : Censo SUAS 2015 - Number of families assisted versus Number of Workers of CRAS
author      : Davi Lopes Carvalho
job         :
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Censo SUAS

Censo SUAS is a census of the Unique System of Social Assitance (SUAS) of Brazil. 
This census occur every year and is collected data from the equipaments and human resources of SUAS. 

This presentation is part of a final project of the Course Developing Data Products from John Hopkins University (Coursera).

---
## Loading Data 

The data used in the application that we will show in this presentation was downloaded from <http://aplicacoes.mds.gov.br/sagi/snas/vigilancia/index2.php>.

And can be loaded in R using these commands

```r
download.file(url = "http://aplicacoes.mds.gov.br/sagi/dicivip_datain/ckfinder/userfiles/files/Censo_SUAS_2015/CensoSUAS2015_CRAS.zip", destfile = "data.zip", method = "curl")
unzip(zipfile = "data.zip")
data<-read.csv2("CRAS/CensoSUAS_2015_CRAS_dadosgerais_divulgacao.csv",fileEncoding = "ISO-8859-1" )
```
The csv file has data from more than 8 thousands CRAS more than 450 variables.
For this application we will use five variables. Below we have the code to subset the data.

```r
data<-data[,c( "UF", "Município", "Porte_pop2010", "nu_trabalhadores", "q14_1")]
```

---
## Shiny Application
The shiny application shows a graph that has on y-axis the number of families that were assisted by a CRAS (Social Assistance Reference Center) and on x-axis the number of workers of that CRAS.

There is two kinds of filters that you can use. On the first filter you select the state you want to see on the plot and the second filter you can choose the size of the cities which the CRAS are located.

The graph shows two red lines on the means of y-axis and x-axis. And each size of city has a line that show the linear regression of points plotted.

---

 <iframe src="https://davicarvalho.shinyapps.io/censoSUAS-Visits-Workers/" scrolling="auto"></iframe> 
 
 
