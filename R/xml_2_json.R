#' @title Quickly transform a xml objet into a json object.
#'
#' @description See title.
#'
#' @param xml An xml object.
#' @return The json-representation of the xml object.
#'
#' @export
#'
xml_2_json <- function(xml) {
  return(RJSONIO::toJSON(xml2::as_list(xml)))
}
