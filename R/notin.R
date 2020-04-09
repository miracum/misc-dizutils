#' @title notin helper function
#'
#' @description Function to return elements of x that are not in y.
#'
#' @param x Object 1.
#' @param y Object 2.
#'
#' @export
# define %notin% function
"%!in%" <- function(x, y) { # nolint
  return(
    !("%in%"(x, y)) # nolint
  )
}
