#' Obter intensidade num ponto no norte de portugal a partir da duração da chuvada e período de retorno
#' @param d é uma duração de classe _Duration_
#' @param f é um período de retorno em anos, por exemplo 20
#' @param lugar é um ponto no espaço de classe _sf_
#' @importFrom dplyr "%>%" filter mutate select
#' @importFrom gstat idw
#' @importFrom sf as_Spatial st_crs st_transform
#' @export
intensidade = function(d,f,lugar)
{
  if(class(d)[1]!='Duration') stop('*d* must be of class Duration')
  if(!(f %in% c(2,5,10,20,50,100,500,1000))) stop('*f* must be one of 2,5,10,20,50,100,500 or 1000')
  if(class(lugar)[1]!='sf') stop('*lugar* must be of class sf')
  
  if(toupper( st_crs(lugar)[1]$input ) != 'EPSG:3763') lugar=st_transform(lugar,3763)

  lugar_sp=sf::as_Spatial(lugar)

  idf_sp=idf_sf %>%
    dplyr::filter(limite_superior>d & limite_inferior<d,T==f) %>%
    dplyr::select(a,b) %>%
    dplyr::mutate(i=a*as.numeric(d,'minutes')^b) %>%
    sf::as_Spatial(.)

  i_pred=gstat::idw(i~1,idf_sp,newdata=lugar_sp)
  return(i_pred$var1.pred * with(units::ud_units, mm/h))

}
