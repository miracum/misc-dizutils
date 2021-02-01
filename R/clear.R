# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2021 Universitätsklinikum Erlangen
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
