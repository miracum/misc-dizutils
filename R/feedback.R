#' @title Function to feedback messages either to the user and/or to the
#'   console and to the logfile.
#' @description This function provides the functionality to publish
#'   any kind of information to the user, the console and/or to the logfile.
#'   This might be a simple info, a warning or an error.
#'   The function can be used to select the output (console, ui, logfile).
#'   If no output is selected, the print_this string will be printed to the
#'   console and to logfile.
#'   One of these must be a string with length > 0: print_me, console, ui
#' @param print_this (Optional, String)
#' @param type (Optional, String) E.g. "Warning", "Error. Default: "Info"
#' @param ui (Optional, Boolean/String) If true, the message will
#'   also be printed to the user in form of a modal. Can also be a string.
#' @param console (Optional, Boolean/String) If true, the message will also
#'   be printed to the console as is. Can also be a string.
#' @param logfile (Optional, Boolean) If true (default) the print_this string
#'   will also be printed to the console.
#' @param logjs (Optional, Boolean) If true (default: false) the print_this
#'   string will also be printed to the javascript-console.
#'   This only makes sense, if the gui is active.
#' @param prefix Prefix (Optional, String) This is useful if
#'   print_this is an array/list.
#'   Each entry will then be new row with this prefix.
#' @param suffix Suffix (Optional, String). Same like prefix but at the
#'   end of each line.
#' @param findme (Optional, String) String to find the message in the code.
#'   E.g. 10-digit random hex from https://www.browserling.com/tools/random-hex
#'   or https://onlinerandomtools.com/generate-random-hexadecimal-numbers
#' @param logfile_dir The absolute path to folder where the logfile
#'   will be stored.
#'
#' @inheritParams db_connection
#'
#' @export
#'
feedback <-
  function(print_this = "",
           type = "Info",
           ui = FALSE,
           console = TRUE,
           logfile = TRUE,
           logjs = FALSE,
           prefix = "",
           suffix = "",
           findme = "",
           logfile_dir = tempdir(),
           headless = TRUE) {
    # Make the first letter of type Uppercase:
    type <- firstup(type)

    # If the gui is active, show the message to the user.
    # If its an error message, also show the error messages in the gui
    # even if the user did not explicitely said it should be displayed
    # in the gui
    if (isTRUE(ui) ||
        (isFALSE(headless) &&
         isTRUE(type == "Error") && isFALSE(ui))) {
      feedback_to_ui(print_this = print_this, type = type)
    }

    if ((isTRUE(console) && isFALSE(print_this == "")) ||
        (isTRUE(typeof(console) == "character"))) {
      feedback_to_console(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix,
        logjs = logjs,
        logfile_dir = logfile_dir
      )
    }

    # If there is text defined in 'ui' and/or 'console', print this one
    # (this is uesful if one will provide both, feedback to the ui AND
    # feedback to the console but with different texts).
    # Hint: Everything printed to the console will also
    #       be printed to the logfile.
    if (isTRUE(typeof(ui) == "character")) {
      feedback_to_ui(print_this = print_this, type = type)
    }
  }

#' @title Print to the console. Internal use.
#' @description  Helper function for the feedback function to print
#'   stuff to the console. Everything will also be added to the logfile.
#'   Internal use. Use the robust 'feedback' function instead.
#'
#' @inheritParams feedback
#'
feedback_to_console <-
  function(print_this,
           type,
           findme,
           prefix,
           suffix,
           logjs,
           logfile_dir) {
    if (length(print_this) == 1) {
      res <-
        feedback_get_formatted_string(
          print_this = print_this,
          type = type,
          findme = findme,
          prefix = prefix,
          suffix = suffix
        )
      # To console:
      message(res)
      # To logjs:
      if (isTRUE(logjs)) {
        feedback_to_logjs(res)
      }
      # To logfile:
      feedback_to_logfile(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix,
        logfile_dir
      )
    } else if (length(print_this) > 1) {
      i <- 1
      for (tmp in print_this) {
        res <-
          feedback_get_formatted_string(
            print_this = tmp,
            type = type,
            findme = findme,
            prefix = paste0(prefix, i, ": "),
            suffix = suffix
          )
        # To console:
        message(res)
        # To logjs:
        if (isTRUE(logjs)) {
          feedback_to_logjs(res)
        }
        # To logfile:
        feedback_to_logfile(
          print_this = tmp,
          type = type,
          findme = findme,
          prefix = prefix,
          suffix = suffix,
          logfile_dir
        )
        i <- i + 1
      }
    }
  }

#' @title Feedback to the user with a modal. Internal use.
#' @description  Helper function for the feedback function to show modals
#'   to the gui/user. Everything will also be added to the logfile.
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#'
feedback_to_ui <-
  function(print_this, type, logfile_dir, headless) {
    catch_msg <- paste0("Something went wrong while trying",
                        " to show feedback to the UI: ")
    tryCatch({
      if (isTRUE(type == "Error")) {
        title <- "Sorry, an error has occured"
      } else {
        title <- type
      }
      shiny::showModal(shiny::modalDialog(title = title,
                                          easyClose = TRUE,
                                          print_this))
    },
    error = function(cond) {
      feedback(
        print_this = paste0(catch_msg, cond),
        type = "Error",
        findme = "58eb015c10",
        logfile_dir = logfile_dir,
        headless = headless
      )
    },
    warning = function(cond) {
      feedback(
        print_this = paste0(catch_msg, cond),
        type = "Warning",
        findme = "ef7fa319a5",
        logfile_dir = logfile_dir,
        headless = headless
      )
    })
  }

#' @title Feedback to the gui/browser-console with logjs. Internal use.
#' @description  Helper function for the feedback function to also show the
#'   messages to the gui/user via the browser console.
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#'
feedback_to_logjs <- function(print_this, logfile_dir, headless) {
  catch_msg <- paste0("Something went wrong while trying",
                      " to print feedback to the browser console: ")
  tryCatch({
    shinyjs::logjs(print_this)
  },
  error = function(cond) {
    feedback(
      print_this = paste0(catch_msg, cond),
      type = "Error",
      findme = "2e68833975",
      logfile_dir = logfile_dir,
      headless = headless
    )
  },
  warning = function(cond) {
    feedback(
      print_this = paste0(catch_msg, cond),
      type = "Warning",
      findme = "f3600cc9d2",
      logfile_dir = logfile_dir,
      headless = headless
    )
  })
}

#' @title Add to the logfile. Internal use.
#' @description  Helper function for the feedback function to add content
#'   to the logfile. Internal use.
#'   Use the robust 'feedback' function instead.
#' @inheritParams feedback
#'
feedback_to_logfile <-
  function(print_this,
           type,
           findme,
           prefix,
           suffix,
           logfile_dir) {
    # Get the formatted string out of the parameters which looks like
    # "[Info] System is running (1234567890)":
    res <- feedback_get_formatted_string(
      print_this = print_this,
      type = type,
      findme = findme,
      prefix = prefix,
      suffix = suffix
    )
    # Set the string for the logfile containing the current time and date
    # and a linebreak at the end:
    res <- paste0("[", Sys.time(), "] ", res, "\n")

    path_with_file <- paste0(logfile_dir, "logfile.log")

    # Open the connection to the logfile:
    log_con <- file(path_with_file, open = "a")
    # Write to the logfile:
    cat(res, file = log_con)
    # Close the connection to logfile:
    close(log_con)
  }

#' @title Format the feedback string
#' @description  Helper function for the feedback function to combine the input
#'   parameters in proper manner to ge a pretty and informative string which
#'   than can be added to the logfile and/or be displayed in the console.
#'   CAUTION: 'print_this' must be of length 1! For arrays loop through them
#'   by hand and call this function several times!
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#'
feedback_get_formatted_string <-
  function(print_this, type, findme, prefix, suffix) {
    if (length(print_this) == 1) {
      if (findme == "") {
        res <- paste0("[", type, "] ", prefix, print_this, suffix)
      } else {
        res <- paste0("[", type, "] ",
                      prefix, print_this, suffix, " (", findme, ")")
      }
    } else {
      res <- paste0("Length of input 'print_this' is not == 1. ",
                    "See function description. (55a445fe57)")
    }
    return(res)
  }

#' @title Archives the current logfile and creates a new blank one.
#' @description  This function is called once at the beginning of the
#'   runtime of the tool. It checks whether there is an old logfile
#'   and renames it (if existing) to "logfile_20xx-xx-xx-xxxxxx.log".
#'   Then a new, empty, logfile "logfile.log" is created.
#'
#' @inheritParams feedback
#'
#' @export
#'
cleanup_old_logfile <- function(logfile_dir) {
  path_with_file <- paste0(logfile_dir, "logfile.log")
  # Check if logfile.log is already the logfile for this session:
  if (isTRUE(file.exists(path_with_file))) {
    ## There is an old logfile, so rename the logfile.log to
    ## logfile_2020-01-01-1234h:
    filename_datetime <- format(Sys.time(), "%Y-%m-%d-%H%M%OS")
    path_with_file_datetime <-
      paste0(logfile_dir, "logfile_", filename_datetime, ".log")
    file.rename(from = path_with_file, to = path_with_file_datetime)
    ## ... and create a new logfile:
    file.create(path_with_file)
  }
}
