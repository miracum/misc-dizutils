#' @title Quickly get the current timestamp
#'
#' @description Function to quickly get the current timestamp without
#'   need to handle format-options etc.
#'
#' @param no_spaces Boolean. Default = `FALSE`. Specifies wether the output
#'   can contain spaces or not. E.g. if the output is for human reading,
#'   `no_spaces = FALSE` is a good option. As suffix for filenames
#'   (e.g. logfiles), `no_spaces = TRUE` might be a good option.
#' @return The current timestamp in always the same format.
#'#'
#' @examples
#' get_current_timestamp(no_spaces = TRUE)
#' # Result: "2020-12-03-134354"
#' get_current_timestamp() or get_current_timestamp(no_spaces = FALSE)
#' # Result: "03.12.2020 - 13:43 UTC"
#'
#' @export
#'
get_current_timestamp <- function(no_spaces = FALSE) {
  if (no_spaces) {
    return(format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
  } else {
    return(format(Sys.time(), format = "%d.%m.%Y - %H:%M UTC"))
  }
}
