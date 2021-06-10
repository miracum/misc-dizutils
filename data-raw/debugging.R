# Cleanup the backend in RStudio:
cat("\014") # Clears the console (imitates CTR + L)
rm(list = ls(all.names = TRUE)) # Clears the Global Environment/variables/data
invisible(gc()) # Garbage collector/Clear unused RAM

## Start to code here:

## Load the variables from a file:
DIZutils::set_env_vars(env_file = "../env_INTERNAL.ini")

system_name = "i2b2"
logfile_dir = tempdir()
headless = TRUE
ignore_presets = FALSE
uppercase_system = TRUE
get_config_env(
  system_name = system_name,
  logfile_dir = logfile_dir,
  headless = headless,
  ignore_presets = ignore_presets,
  uppercase_system = uppercase_system
)
tmp <- sapply(c("i2b2", "omop"), function(x) {
  DIZutils::get_config_env(
    system_name = x
  )
}, USE.NAMES = T, simplify = F)
tmp


get_display_name_from_settings <- function(settings, name = NULL) {
  return(unlist(lapply(seq_along(settings), function(i) {
    if (!is.null(settings[[i]]$nested) && settings[[i]]$nested) {
      settings[[i]]$nested <- NULL
      return(get_display_name(settings[[i]], name = name))
    } else {
      if (is.null(settings[[i]]$displayname)) {
        if (is.null(name)) {
          return(names(settings)[[i]])
        } else {
          return(name)
        }
      } else {
        return(settings[[i]]$displayname)
      }
    }
  })))
}
get_display_name_from_settings(settings)

settings <- tmp

get_display_name2 <- function(settings){
  return(
    lapply(names(tmp), function(system, names, settings){
      if (!is.null(settings[[system]]$nested) && settings[[system]]$nested) {
        return(get_display_name2(settings[[system]]))
      } else {
        return(get_display_name(name = system, settings = settings_tmp))
      }
    }, names = names(tmp), settings = tmp)
  )
}
get_display_name(settings)

