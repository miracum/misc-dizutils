# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2022 Universitätsklinikum Erlangen, Germany, Germany
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

#' @title Cleanup function to unset/close all open connections
#' @description This function is meant to be called at the end of a
#'   run of the app. It will close all open connections to files
#'   or databases. This closes ALL connections. Not just the ones
#'   opened by this package.
#'
#' @return No return value, called for side effects (see description)
#' @examples
#' \donttest{
#'   close_all_connections()
#' }
#' @export
#'
close_all_connections <-
  function() {
    # used in dqastats and dqagui
    DIZtools::close_all_connections()
  }
