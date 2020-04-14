#' @title notin helper function
#'
#' @description Function to return elements of x that are not in y.
#'
#' @param x Object 1.
#' @param y Object 2.
#'
#' @export
# define %notin% function
# nolint start
"%notin%" <- function(x, y) {
  # workaround until DIZutils is on CRAN
  # (when using 'importFrom DIZutils %notin%', error exists due to
  # referencing package in NAMESPACE but not as Import in DESCRIPTION)
  # "%notin%" <- utils::getFromNamespace(
  #   x = "%notin%",
  #   ns = "DIZutils"
  # )
  return(!("%in%"(x, y)))
}
# nolint end
