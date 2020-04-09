#' @title clean_path_name helper function
#'
#' @description Function to clean paths to have a tailing slash
#'
#' @param pathname A character string. A path name to be cleaned
#'   (to have a tailing slash).
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Both function calls will return "home/test/"
#' clean_path_name("home/test")
#' clean_path_name("home/test/")
#' }
#'
clean_path_name <- function(pathname) {
  return(gsub("([[:alnum:]])$", "\\1/", pathname))
}
