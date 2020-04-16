#' @title get_config_env helper function
#'
#' @description Internal function to read settings for a certain system
#'   from the environment
#'
#' @param system_name The name of the system (This is also the prefix used
#'   to get the environment variables with 'SYSTEM_KEY', e.g. 'I2B2_DBNAME')
#'
#' @inheritParams db_connection
#'
#' @export
#'
get_config_env <-
  function(system_name,
           logfile_dir,
           headless) {
    res <- tryCatch({
      system_name <- toupper(system_name)
      elements <- list(
        dbname = "_DBNAME"
        , host = "_HOST"
        , port = "_PORT"
        , user = "_USER"
        , password = "_PASSWORD"
        , sid = "_SID"
        , path = "_PATH"
      )

      # Get the environment variable for each all keys:
      res <- lapply(
        X = elements,
        FUN = function(name) {
          tmp <- Sys.getenv(paste0(system_name, name))
          return(tmp)
        }
      )

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
