#' @title set_env_vars helper function
#'
#' @description Internal function to set environment variables that are
#'   necessary for the database connections with \code{db_connection}.
#'
#' @param env_file A character. The full path including the file name to
#'   the file containing the environment variable defintions to be loaded.
#'
#' @seealso \code{Sys.setenv}
#'
#' @export
#'
set_env_vars <- function(env_file) {

  envs <- readLines(env_file)

  args <- sapply(envs, FUN = function(x) {
    # split variables by "="
    l <- unlist(strsplit(x, "="))
    # needed, if value contains "="
    env <- paste(l[2:length(l)], collapse = "")
    # name value
    names(env) <- unlist(strsplit(x, "="))[[1]]
    return(env)
  }, USE.NAMES = F)

  # set all environment variables
  do.call(Sys.setenv, as.list(args))
}