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

#' @title Combine aggregated statistics.
#' @description This function provides the functionality to combine multiple
#'   statistics to a single statistical overview. This is e.g. useful if you
#'   are only allowed to export statistical characteristics from a site but
#'   not the data itself. So in this case you have e.g. mean, median and N
#'   from each site but want to say something about the mean, median and N
#'   over all sites like you had the data of all sites in one big pool and
#'   would do the statisitcs there.
#' @param summaries (data.table) Data table containing all stats you want to
#'   combine as rows. This data.table must contain the columns
#'   `Min`, `Q10`, `Q25`, `Median`, `Mean`, `SD`, `Q75`, `Q90`, `Max`, `N`.
#'   Each row in this data table represents a site as of the example described
#'   above.
#' @param demo (boolean, default = FALSE) Do you want to see how the function
#'   works? Then call `combine_stats(summaries = NULL, demo = TRUE)`.
#' @return A one-row data.table containing the calculated, aggregates
#'   statistics of the input.
#'
#' @export
#'
combine_stats <- function(summaries, demo = FALSE) {
  ## This is only for demonstration or validation:
  if (demo) {
    rows <- 4

    summaries <- data.table::data.table(
      "Min" = numeric(),
      "Q10" = numeric(),
      "Q25" = numeric(),
      "Median" = numeric(),
      "Mean" = numeric(),
      "SD" = numeric(),
      "Q75" = numeric(),
      "Q90" = numeric(),
      "Max" = numeric(),
      "N" = numeric()
    )
    control <- c()
    for (i in 1:rows) {
      ## Sample some numbers:
      y <-
        round(x = stats::rnorm(
          n = sample(1:100, size = 1),
          mean = sample(0:100, size = 1),
          sd = sample(1:10, size = 1)
        ),
        digits = 0)

      ## Also save these numbers for later comparision of the calculated values
      ## with the real values:
      control <- c(control, y)

      ## Setting up the new row:
      tmp <- data.table::data.table(
        "Min" = min(y),
        "Q10" = stats::quantile(y, 0.1),
        "Q25" = stats::quantile(y, 0.25),
        "Median" = stats::median(y),
        "Mean" = mean(y),
        "SD" = stats::sd(y),
        "Q75" = stats::quantile(y, 0.75),
        "Q90" = stats::quantile(y, 0.9),
        "Max" = max(y),
        "N" = length(y)
      )

      ## Add the new row to the existing dataset:
      summaries <-
        data.table::rbindlist(list(summaries, tmp), use.names = TRUE)
    }
    cat("\n\nYou used the function in demo-mode.\nThis is the randomly chosen demo-data:\n")
    print(summaries)
  }

  res <- data.table::data.table(
    "Min" = ifelse(all(is.na(summaries[["Min"]])), "", min(x = summaries[["Min"]], na.rm = T)),
    "Q10" = ifelse(all(is.na(summaries[["Q10"]])), NA, as.numeric(
      Hmisc::wtd.quantile(
        x = as.numeric(summaries[["Q10"]]),
        weights = summaries[["N"]],
        probs = c(0.1)
      )
    )),
    "Q25" = ifelse(all(is.na(summaries[["Q25"]])), NA, as.numeric(
      Hmisc::wtd.quantile(
        x = summaries[["Q25"]],
        weights = summaries[["N"]],
        probs = c(0.25)
      )
    )),
    "Median" = ifelse(all(is.na(summaries[["Median"]])), NA, as.numeric(
      Hmisc::wtd.quantile(
        x = summaries[["Median"]],
        weights = summaries[["N"]],
        probs = c(0.5)
      )
    )),
    "Mean" = ifelse(all(is.na(summaries[["Mean"]])), NA, as.numeric(
      Hmisc::wtd.mean(x = summaries[["Mean"]], weights = summaries[["N"]])
    )),
    "SD" = ifelse(all(is.na(summaries[["SD"]])), NA, sqrt(
      Hmisc::wtd.mean(x = summaries[["SD"]] ^ 2, weights = summaries[["N"]])
    )),
    "Q75" = ifelse(all(is.na(summaries[["Q75"]])), NA, as.numeric(
      Hmisc::wtd.quantile(
        x = summaries[["Q75"]],
        weights = summaries[["N"]],
        probs = c(0.75)
      )
    )),
    "Q90" = ifelse(all(is.na(summaries[["Q90"]])), NA, as.numeric(
      Hmisc::wtd.quantile(
        x = summaries[["Q90"]],
        weights = summaries[["N"]],
        probs = c(0.9)
      )
    )),
    "Max" = ifelse(all(is.na(summaries[["Max"]])), NA, max(summaries[["Max"]], na.rm = T)),
    "N" = sum(summaries[["N"]])
  )

  if (demo) {
    ## Real combined stats:
    cat("\n\nThis is the 'real' aggregated statistics over the whole data-pool:\n")
    print(psych::describe(control, quant = c(.1, .25, .5, .75, .9)))

    ## Calculated summary statistics:
    cat(
      "\n\nAnd this is the calculated aggregated statistics (which is the return value of this function):\n"
    )
    # print(res)
  }

  return(res)
}
