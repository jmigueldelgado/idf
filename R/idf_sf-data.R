#' Parâmetros das curvas IDF
#'
#' Parâmetros das curvas IDF obtidas por \href{https://snirh.apambiente.pt/snirh/download/relatorios/relatorio_prec_intensa.pdf}{Brandão e Rodrigues 2001}
#'
#' @docType data
#'
#' @usage data(idf)
#'
#' @format An object of class \code{"tibble"}.
#'
#' @keywords datasets
#'
#'
#' @source \href{http://www.civil.ist.utl.pt/~mps/Mod_hid/Teoria/teoria 2007 para jpg.pdf}{Apontamentos de modelação hidrológica da Professora Maria Manuela Portela}
#'
#' @examples
#' data(idf)
#' \donttest{head(idf)}
"idf_sf"

#' Bacia hidrográfica do Rio Sousa na Senhora do Salto
#'
#' Obtida para servir de exemplo na aplicação das IDFs
#'
#' @docType data
#'
#' @usage data(bacia)
#'
#' @format An object of class \code{"sf"}.
#'
#' @examples
#' data(bacia)
#' \donttest{plot(bacia)}
"bacia"
