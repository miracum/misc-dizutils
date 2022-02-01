# DIZutils NEWS

## Unreleased (2022-02-01)

#### Others

* moved news.md to .rbuildignore

Full set of changes: [`v0.0.11...9c6d85e`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.11...9c6d85e)

## v0.0.11 (2022-02-01)

#### New Features

* added close_connection wrapper function
* added update script for `NEWS.md`
* added function `rep2`
* added `setenv2` as function
#### Docs

* updated copyright to 2022
#### Others

* updated news.md
* merge development
* updated buildignore
* new cran version

Full set of changes: [`v0.0.9...v0.0.11`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.9...v0.0.11)

## v0.0.9 (2021-12-08)

#### New Features

* added possibility to assign more than one system in the env
* added argument to close connections after db call
#### Fixes

* added connection closing after querying the db
* fixed gh actions
#### Refactorings

* fixed ci test lints
* fixing ci tests
* fixing ci tests
* fixing ci tests
#### Docs

* updated man
#### Others

* fixed ci lints
* removed lagacy code
* added libs for rjava

Full set of changes: [`v0.0.8...v0.0.9`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.8...v0.0.9)

## v0.0.8 (2021-05-25)

#### New Features

* added `is_date_format()` function
* added function `equals2`
* added `no_return` as parameter to `query_database`
* added new function `format_POSIXct`
* added `check_if_table_exists` function
#### Fixes

* :ambulance: changed `db_name` to `system_name`
* db_name was interpreted false
#### Refactorings

* optimzied `db_connection` to allow minimal inputs only
#### Docs

* fixed manual of `query_database()`
* fixed escaping error in manual
* updated manual
* updated DESCRIPTION
* updated readme for new parameter of `db_connection`
#### Others

* switched to central gitlab-ci.yml
* added previous install step to test-pipeline
* added previous install step to test-pipeline
* updated gitlab-ci to use the base image
* improvement of feedback function-feedback
* added `parsedate` as import
* added explicit parameter calls

Full set of changes: [`v0.0.7...v0.0.8`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.7...v0.0.8)

## v0.0.7 (2021-02-11)

#### New Features

* added `clear` function
* added function `string_replacements`
* added function `combine_stats`
* added function `xml_2_json`
* enhanced `clean_path_name` and `get_config_env`
* added function `setdiff_all`
* added "get_db_systems" and "get_current_timestamp" functions
* added function `get_current_timestamp`
#### Fixes

* fixed bug where `feeback` function uses a missing argument for `headless` or `logfile_dir`
* fixed feedback function to also work with empty or NULL logfile_dir
* bugfix in get_config_env where the name of the named list was wrong
#### Refactorings

* preparing for new release
* preparation for new release
* preparation for new release
* adadpted demo url for dockerfile for jdbc drivers
* added rubstness to `db_connection` function
* more robust functions
* added check for completeness of input variables for `db_connection` function
* made arguments `headless` in functions `feedback_to_ui` and `feedback_to_console` optional
* added `tolower` and `toupper` to function `string_replacements`
* optimized screen texts for combine_stats demo
#### Docs

* updated readme
* updated news.md
* updated manual files
* updated `news.md`
* updated `news.md`
* updated news.md
* updated news.md
* updated news.md
* styl md
* fixed md style
#### Others

* readme linting

Full set of changes: [`v0.0.6...v0.0.7`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.6...v0.0.7)

## v0.0.6 (2020-11-17)

#### Fixes

* removed console prints from debugging
* fixed oracle and postrges connection setup
#### Refactorings

* added system requirements for cran checks
#### Docs

* updated description; added cran-comments
* added changelog

Full set of changes: [`v0.0.5...v0.0.6`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.5...v0.0.6)

## v0.0.5 (2020-09-14)


Full set of changes: [`v0.0.4...v0.0.5`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.4...v0.0.5)

## v0.0.4 (2020-06-04)


Full set of changes: [`v0.0.3...v0.0.4`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.3...v0.0.4)

## v0.0.3 (2020-05-07)


Full set of changes: [`v0.0.2...v0.0.3`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.2...v0.0.3)

## v0.0.2 (2020-04-20)

