#' @title set_env_vars helper function
#'
#' @description Internal function to set environment variables that are
#'   necessary for the database connections with \code{db_connection}.
#'
#' @param env_file A character. The full path including the file name to
#'   the file containing the environment variable definitions to be loaded.
#'
#' @seealso \code{Sys.setenv}
#' @return No return value, called for side effects (see description)
#' @examples
#' \dontrun{set_env_vars("./.env")}
#'
#' @export
#'
set_env_vars <- function(env_file) {

  envs <- readLines(env_file)

  args <- sapply(envs, FUN = function(x) {
    # split variables by "="
    l <- unlist(strsplit(x, "="))
    if (length(l) > 1) {
      # needed, if value contains "="
      env <- paste(l[2:length(l)], collapse = "=")
      # name value
      names(env) <- unlist(strsplit(x, "="))[[1]]
    } else {
      env <- ""
      names(env) <- l
    }
    return(env)
  }, USE.NAMES = F)

  # set all environment variables
  do.call(Sys.setenv, as.list(args))
}
