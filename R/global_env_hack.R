#' @title global_env_hack
#' @description Hack variable into global env (bypasses R CMD checks).
#'
#' @param key A character string. The name of the assigned variable
#' @param val An object. The object that will be assigned to 'key'.
#' @param pos An integer. The position of the environment (default: 1).
#'
#' @seealso \url{http://adv-r.had.co.nz/Environments.html}
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
