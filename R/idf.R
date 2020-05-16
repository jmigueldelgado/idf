#' Obter intensidade num ponto no norte de portugal a partir da duração da chuvada e período de retorno
#' @importFrom dplyr "%>%"
#' @export
df2i = function(d,f,lugar)
{
  lugar_sp=sf::as_Spatial(lugar)

  idf_sp=idf_sf %>%
    dplyr::filter(limite_superior>d & limite_inferior<d,T==f) %>%
    dplyr::select(a,b) %>%
    dplyr::mutate(i=a*as.numeric(d,'minutes')^b) %>%
    sf::as_Spatial(.)

  i_pred=gstat::idw(i~1,idf_sp,newdata=lugar_sp)
  return(i_pred$var1.pred * with(units::ud_units, mm/h))

}
