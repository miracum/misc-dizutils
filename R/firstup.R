#' @title Converts the first letter of the input string to uppercase
#' @description Converts the first letter of the input string to uppercase
#'
#' @param x A character string. E.g. "hello world" will become "Hello world".
#' @return Returns the input string but with a capital first letter.
#' @examples
#' firstup("first letter will be upper case as return")
#'
#' @export
#'
firstup <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  return(x)
}
