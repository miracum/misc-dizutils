#' @title global_env_hack
#' @description Hack variable into global env (bypasses R CMD checks).
#'
#' @param key A character (!) string. The name of the assigned variable
#' @param val An object. The object that will be assigned to 'key'.
#' @param pos An integer. The position of the environment (default: 1).
#'
#' @seealso \url{http://adv-r.had.co.nz/Environments.html}
#' @return No return value, called for side effects (see description).
#' @examples
#' \dontrun{
#' global_env_hack(
#'   key = "utils_path",
#'   val = utils_path,
#'   pos = 1L
#' )}
#'
#' @export
#'
global_env_hack <- function(key,
                            val,
                            pos = 1) {
  assign(
    key,
    val,
    envir = as.environment(pos)
  )
}
