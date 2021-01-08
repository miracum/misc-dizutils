#' @title clean_path_name helper function
#'
#' @description Function to clean paths to surely have a tailing slash or not
#'
#' @param pathname A character string. A path name to be cleaned
#'   (to have a tailing slash or not).
#' @param remove.slash (boolean) Default: FALSE. Should the result
#'   contain the tailing slash or remove it?
#' @return The result is the input but with an tailing slash.
#'
#'
#' @examples
#' # Both function calls will return "home/test/"
#' clean_path_name("home/test")
#' clean_path_name("home/test/")
#'
#' @export
#'
clean_path_name <- function(pathname, remove.slash = FALSE) {
  if (remove.slash) {
    return(gsub("\\/$", "", pathname))
  } else {
    return(gsub("([[:alnum:]])$", "\\1/", pathname))
  }
}
