#' @title Quickly get all currently implemented database systems
#'
#' @description Function to quickly get the currently implemented database
#'   systems
#'
#' @return The currently implemented database systems as string array.
#'   `E.g. c("postgres", "oracle")`
#'#'
#' @examples
#' get_db_systems()
#' # Result: c("postgres", "oracle")
#'
#' @export
#'
get_db_systems <- function() {
  return(c("postgres", "oracle"))
}
