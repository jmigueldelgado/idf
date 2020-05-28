# idf

Este pacote pretende ajudar engenheiros e técnicos a estimar uma chuvada de projecto a partir das curvas de intensidade-duração-frequência propostas por [[1]](#1).

## Instalação

```{r}
devtools::install_github('jmigueldelgado/idf')
```

## Como usar

Chamar a função `intensidade` com os parâmetros duração `d` de classe _sf_, período de retorno `f` e um ponto georreferenciado `lugar` de classe _sf_.

## Domínio de utilização

Neste momento o pacote só está disponível para a região acima do Mondego.

## Exemplo

Para um exemplo remeto à [vignette](vignettes/idf_bacia_sousa.md)

## Bibliografia
<a id="1">[1]</a> Brandão, C.; Rodrigues, R.; Costa, J. P. Análise de Fenómenos Extremos. Precipitações Intensas Em Portugal Continental. Direcção dos Serviços de Recursos Hídricos 2001, 64.
