#' @title get_config_env helper function
#'
#' @description Internal function to read settings for a certain system
#'   from the environment.
#'   IMPORTANT: If yout want to get any result with your input as prefix,
#'   use `ignore.presets = TRUE`! See param-definition for more details.
#'
#' @param system_name The name of the system (This is also the prefix used
#'   to get the environment variables with 'SYSTEM_KEY', e.g. 'I2B2_DBNAME')
#' @param ignore.presets (boolean) Only return something if all elements
#'   from the presets are found? These are currently `host`, `port`, `user`,
#'   `password`, `sid`, `path`. If you have another suffix after
#'   `system_name` in your config file, you won't see it here. To see
#'   everything with prefix `system_name` simply set `ignore.presets = TRUE`.
#'
#' @inheritParams db_connection
#' @return If successful it returns the config, null otherwise.
#' @examples
#' \donttest{
#' get_config_env(
#'   system_name = "i2b2",
#'   logfile_dir = tempdir(),
#'   headless = FALSE
#' )}
#'
#' @export
#'
get_config_env <-
  function(system_name,
           logfile_dir = tempdir(),
           headless = TRUE,
           ignore.presets = FALSE) {
    res <- tryCatch({
      system_name <- toupper(system_name)
      if (ignore.presets) {
        env_names_tmp <- names(Sys.getenv())
        elements <-
          env_names_tmp[grepl(pattern = paste0("^", system_name, "_*"),
                              x = env_names_tmp)]

        # Get the environment variable for these elements:
        res <- sapply(
          X = elements,
          FUN = function(name) {
            tmp <- list()
            tmp[name] = Sys.getenv(name)
            return(Sys.getenv(name))
          }
        )
        res <- as.list(res)
      } else {
        elements <- list(
          dbname = "_DBNAME",
          host = "_HOST",
          port = "_PORT",
          user = "_USER",
          password = "_PASSWORD",
          sid = "_SID",
          path = "_PATH"
        )

        # Get the environment variable for each all keys:
        res <- lapply(
          X = elements,
          FUN = function(name) {
            tmp <- Sys.getenv(paste0(system_name, name))
            return(tmp)
          }
        )
      }

      # Now remove the empty entries:
      res <- res[lapply(res, nchar) > 0]

      # And finish:
      return(res)
    },
    error = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      feedback(
        print_this = paste0("Error in 'get_config_env'. ", cond),
        type = "Error",
        findme = "83a71e6153",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    },
    warning = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      feedback(
        print_this = paste0("Warning in 'get_config_env'. ", cond),
        type = "Warning",
        findme = "586b76a724",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    })
    return(res)
  }
