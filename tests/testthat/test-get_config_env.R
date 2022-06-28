# DIZtools - Utilities for 'DIZ' R Package Development
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


test_that(desc = "test of function `get_config_env()`", code = {
  system_name_test <-
    paste(sample(
      x = LETTERS,
      size = 10,
      replace = TRUE
    ), collapse = "")
  # separator <-
  #   sample(x = c("_", "-", ".", " "),
  #          size = 1,
  #          replace = FALSE)
  separator <- "_"

  ## First we create a simple set of new environment-variables without nesing:
  new_list <- list()
  new_list[[paste0(system_name_test, separator, "HOST")]] <- 1
  new_list[[paste0(system_name_test, separator, "DBNAME")]] <-
    "new_value"
  new_list[[paste0(system_name_test, separator, "USER")]] <-
    "test me,m,;!'§$%&/()=`´"
  new_list[[paste0(system_name_test, separator, "RANDOMSTRINGASDF")]] <-
    4

  ## Assign them to the environment:
  do.call(Sys.setenv, new_list)

  ## We expect all of them to be present in the environment now:
  for (element in names(new_list)) {
    testthat::expect_equal(object = as.character(new_list[[element]]),
                           expected = Sys.getenv(element))
  }

  ## So now check if the function we are checking works in different scenarios.
  ## First: No Presets:
  result <-
    get_config_env(system_name = system_name_test, ignore_presets = TRUE)
  testthat::expect_length(object = result, n = length(new_list))
  testthat::expect_equivalent(object = sort(unlist(result, use.names = FALSE)),
                              expected = sort(as.character(as.vector(
                                unlist(new_list, use.names = FALSE)
                              ))))
  rm(result)

  ## Second, with presets:
  result <-
    get_config_env(system_name = system_name_test, ignore_presets = FALSE)
  elements_in_results_and_default <- grep(
    pattern = paste0(
      "(",
      paste(get_default_config_elements(), collapse = "|"),
      ")$"
    ),
    x = names(new_list),
    value = TRUE
  )
  testthat::expect_length(object = result,
                          n = length(elements_in_results_and_default))
  testthat::expect_equivalent(object = sort(names(result)),
                              expected = sort(
                                gsub(
                                  pattern = "^(.)+(_)",
                                  replacement = "",
                                  x = tolower(elements_in_results_and_default)
                                )
                              ))

  ## OK - cleanup:
  rm(result)

  ## Remove the test variables from the environment:
  for (element in names(new_list)) {
    Sys.unsetenv(x = element)
  }
  rm(new_list)



  ## Next task: Nested config
  ## First we create a simple set of new environment-variables without nesing:
  new_list <- list()
  new_list[[paste0(system_name_test, separator, 1, separator, "HOST")]] <-
    "Hostname1"
  new_list[[paste0(system_name_test, separator, 1, separator, "DBNAME")]] <-
    "DBname1"
  new_list[[paste0(system_name_test, separator, 1, separator, "USER")]] <-
    "username1"
  new_list[[paste0(system_name_test,
                   separator,
                   1,
                   separator,
                   "RANDOMSTRINGASDF")]] <-
    "randomstuff1"
  new_list[[paste0(system_name_test, separator, 1, separator, "DISPLAYNAME")]] <-
    "System 1"
  new_list[[paste0(system_name_test, separator, 2, separator, "HOST")]] <-
    "Hostname2"
  new_list[[paste0(system_name_test, separator, 2, separator, "PASSWORD")]] <-
    "password2"
  new_list[[paste0(system_name_test, separator, 2, separator, "USER")]] <-
    "user2"
  new_list[[paste0(system_name_test, separator, 2, separator, "PORT")]] <-
    4
  new_list[[paste0(system_name_test, separator, 3, separator, "DISPLAYNAME")]] <-
    "System 2"
  new_list[[paste0(system_name_test, separator, 3, separator, "HOST")]] <-
    "Hostname3"
  new_list[[paste0(system_name_test, separator, 3, separator, "DBNAME")]] <-
    "dbname3"
  new_list[[paste0(system_name_test, separator, 3, separator, "SID")]] <-
    "sid3"
  new_list[[paste0(system_name_test,
                   separator,
                   3,
                   separator,
                   "ANOTHERRANDOMSTRINGASDF")]] <-
    "randomstuff3"
  new_list[[paste0(system_name_test, separator, 3, separator, "DISPLAYNAME")]] <-
    "System 3"


  ## Assign them to the environment:
  do.call(Sys.setenv, new_list)

  ## We expect all of them to be present in the environment now:
  for (element in names(new_list)) {
    testthat::expect_equal(object = as.character(new_list[[element]]),
                           expected = Sys.getenv(element))
  }

  ## So now check if the function we are checking works in different scenarios.
  ## First: No Presets:
  result <-
    get_config_env(system_name = system_name_test, ignore_presets = TRUE)
  ## Length of result is one more than input, since there is also a flag
  ## `nested = TRUE`:
  testthat::expect_length(object = result, n = 3 + 1)

  ## Compare levels:
  for (level in 1:3) {
    ## Compare level names:
    testthat::expect_equivalent(object = sort(names(result[[level]])),
                                expected = sort(gsub(
                                  pattern = paste0("^(.)+(_", level, "_)"),
                                  replacement = "",
                                  x =
                                    grep(
                                      pattern = paste0(separator, level, separator),
                                      x = tolower(names(new_list)),
                                      fixed = TRUE,
                                      value = TRUE
                                    )
                                )))
    ## Compare level values:
    testthat::expect_equivalent(object = sort(unlist(result[[level]], use.names = FALSE)),
                                expected = sort(unlist(new_list[grep(
                                  pattern = paste0(separator, level, separator),
                                  x = names(new_list),
                                  fixed = TRUE,
                                  value = TRUE
                                )], use.names = FALSE)))
  }

  ## Second, with presets:
  result <-
    get_config_env(system_name = system_name_test, ignore_presets = FALSE)
  elements_in_results_and_default <- grep(
    pattern = paste0(
      "(",
      paste(get_default_config_elements(), collapse = "|"),
      ")$"
    ),
    x = names(new_list),
    value = TRUE
  )
  testthat::expect_length(object = unlist(result),
                          n = length(elements_in_results_and_default) + 1)

  ## Compare levels:
  for (level in 1:3) {
    ## Compare level names
    ## Get result level names:
    result_level_names <- sort(names(result[[level]]))

    ## Get input level names:
    input_level_names <- sort(gsub(
      pattern = paste0("^(.)+(_", level, "_)"),
      replacement = "",
      x =
        grep(
          pattern = paste0(separator, level, separator),
          x = tolower(names(new_list)),
          fixed = TRUE,
          value = TRUE
        )
    ))

    ## There should NOT be a name in the result set, that is not also a
    ## default name:
    testthat::expect_length(
      object = setdiff(result_level_names, tolower(get_default_config_elements())),
      n = 0
    )

    ## There should not be a default name in the input that is missing in the
    ## result set:
    testthat::expect_equal(
      object = sort(intersect(input_level_names,
                              tolower(get_default_config_elements()))),
      expected = sort(result_level_names)
    )

    ## Compare level values:
    result_level_names_full <- paste0(system_name_test,
                                      separator,
                                      level,
                                      separator,
                                      result_level_names)
    testthat::expect_equivalent(object = sort(unlist(result[[level]], use.names = FALSE)),
                                expected = sort(unlist(new_list[toupper(result_level_names_full)], use.names = FALSE)))
    rm(input_level_names, result_level_names, result_level_names_full)
  }

  ## OK - cleanup:
  rm(result)

  ## Remove the test variables from the environment:
  for (element in names(new_list)) {
    Sys.unsetenv(x = element)
  }
  rm(new_list)


  # Sys.getenv("ZKFPHGVALZ_DBNAME")
  # Sys.getenv("TEST_2")

})
