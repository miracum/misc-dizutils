# DIZutils - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2022 Universitätsklinikum Erlangen, Germany
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

context("feedback")

test_that("correct functioning of feedback functions", {

  log_dir <- tempdir()
  expect_length(list.files(log_dir), 0)

  cleanup_old_logfile(log_dir)

  feedback(
    print_this = "This is a first message.",
    logfile_dir = log_dir
  )

  feedback(
    print_this = "This is a second message.",
    logfile_dir = log_dir
  )

  cleanup_old_logfile(log_dir)

  expect_length(list.files(log_dir), 2)

  do.call(
    file.remove,
    list(list.files(tempdir(), pattern = "log$", full.names = TRUE))
  )
})
