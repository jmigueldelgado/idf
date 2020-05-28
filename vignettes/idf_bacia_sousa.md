---
# "IDFs para a bacia do rio Sousa na zona da Senhora do Salto"
author: "JM Delgado"
date: "`r Sys.Date()`"
output:
  rmarkdown::html_vignette: default
  rmarkdown::md_document:
    variant: markdown_github
vignette: >
  %\VignetteIndexEntry{IDFs para a bacia do rio Sousa na zona da Senhora do Salto}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

# Carregar bacia e definir o centróide e área

```{r results='asis', warning=FALSE, message=FALSE}

library(idf)

library(sf,warn.conflicts=FALSE)
library(dplyr,warn.conflicts=FALSE)
library(lubridate)

lugar=st_centroid(bacia)
area=st_area(bacia)

```

Ou de forma ainda mais simples:

```{r results='asis', warning=FALSE, message=FALSE}
lugar=data.frame( long=-8.299, lat=41.232) %>%
  st_as_sf(coords=c('long','lat'))
st_crs(lugar)=4326
```

# Definir tempo de concentração e período de retorno


```{r results='asis', warning=FALSE, message=FALSE}
d=lubridate::as.duration(185*60)            # atribuir valor do tempo de concentração

f=5                                      # período de retorno
```

# Aplicar IDFs e estimar intensidade

```{r results='asis', warning=FALSE, message=FALSE}
i=intensidade(d,f,lugar)                      # intensidade em mm/h
units(i) = with(units::ud_units,m/s)       # converter para unidades SI
C=0.4 # para bacia predominantemente agrícola                                   
q = C*i*area
q
```
