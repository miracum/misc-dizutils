#' @title Clean the console and environment-variables
#'
#' @description Function to clean the local environment.
#'   The call of this function clears the console and the local environment
#'   variables.
#' @param keep_environment (Optional, boolean) If true, the objects from the
#'   environment will not be deleted/emptied.
#' @param keep_console (Optional, boolean) If true, the console will not
#'   be emptied.
#'
#' @return Nothing.
#'
#' @export
#'
clear <- function(keep_environment = FALSE,
                  keep_console = FALSE) {
  ## Inspiration: https://stackoverflow.com/questions/62901476/r-global-function-to-clear-workspace-and-dump-storage
  gctorture(TRUE)
  if (!keep_console) {
    ## Cleanup the backend in RStudio:
    ## Clears the console (imitates CTR + L)
    cat("\014")
  }
  if (!keep_environment) {
    # Clears the Global Environment/variables/data:
    rm(list = ls(all.names = TRUE, envir = sys.frame(-1)),
       envir = sys.frame(-1))
  }
  ## Garbage collector/Clear unused RAM:
  invisible(gc())
  ## Turn it off (important or it gets very slow):
  gctorture(FALSE)
}
