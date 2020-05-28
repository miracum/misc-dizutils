#' @title notin helper function
#'
#' @description Function to return elements of x that are not in y.
#'
#' @param x Object 1.
#' @param y Object 2.
#' @return Returns the result of !%in%(x,y)
#' @examples
#' tmp1 <- c("a","b","c")
#' tmp2 <- c("b", "c", "d")
#' tmp1 %notin% tmp2
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
