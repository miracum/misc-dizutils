#' @title Cleanup function to unset/close all open connections
#' @description This function is meant to be called at the end of a
#'   run of the app. It will close all open connections to files.
#'
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#' @examples
#' \dontrun{
#' close_all_connections(
#'   logfile_dir = "path/to/logfile/dir/",
#'   headless = TRUE
#' )}
#' @export
#'
close_all_connections <- function(logfile_dir, headless) {
  feedback(
    "Doing application cleanup",
    findme = "8b224d503c",
    logfile_dir = logfile_dir,
    headless = headless
  )
  lapply(showConnections(), close)
  feedback(
    "Closed all file-connections.",
    findme = "0c5cb72ecc",
    logfile_dir = logfile_dir,
    headless = headless
  )
}
