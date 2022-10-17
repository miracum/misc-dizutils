# DIZutils NEWS

## Unreleased (2022-09-26)

#### Refactorings

-   updated `get_config_env` to handle nested lists correctly
    ([a948d7f](https://gitlab.miracum.org/miracum/misc/dizutils/tree/a948d7fdb9d2054b836604a3df9e476fdbe721b6))

#### CI

-   exclusion to fix linting errors
    ([585ea62](https://gitlab.miracum.org/miracum/misc/dizutils/tree/585ea62b9b8a1be3617b5204f55ae3ce196d376b))
-   removed gitlab-ci in favor of github actions
    ([b795ffe](https://gitlab.miracum.org/miracum/misc/dizutils/tree/b795ffe3c13d1d4a4a72c96718364378ce08dffd))
-   added deps for devtools
    ([0068a7e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/0068a7ec33bfa9fa8249794b73c528ec6549ef79))

#### Other changes

-   updated news.md
    ([f1c543b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f1c543be34c8d45f5a1313a52915aded3970cf00))
-   updated news.md
    ([d3168f3](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d3168f37014023f12de27849473486112e47db3d))
-   updated remotes section of description
    ([b129e3b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/b129e3b9be1079d9ecc2e4b07b8b9a71a7758687))
-   news.md now with autonewsmd package
    ([722f264](https://gitlab.miracum.org/miracum/misc/dizutils/tree/722f264cdb6734fcb404ad0314c60d1f1efd02c2))

Full set of changes:
[`v0.1.1...f5dd537`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.1.1...f5dd537)

## v0.1.1 (2022-06-27)

#### New features

-   excluding public schema from schema-setting
    ([036b964](https://gitlab.miracum.org/miracum/misc/dizutils/tree/036b96409cacc2c7126952dbc55e88fa96c675ae))
-   added possibility to define db-schema via env-vars
    ([f6b2ee9](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f6b2ee903a411a813d52764a9714041e2ff56fa9))
-   added logo
    ([ed1aaa0](https://gitlab.miracum.org/miracum/misc/dizutils/tree/ed1aaa015b973f48a53b83cd777a4bbec1a56467))
-   adding postgres options to db\_con
    ([77ba81f](https://gitlab.miracum.org/miracum/misc/dizutils/tree/77ba81ff58a977d5d0eab3806024ac22512f9dc6))

#### Bug fixes

-   better checking for unset envar ‘schema’
    ([6bbfd6d](https://gitlab.miracum.org/miracum/misc/dizutils/tree/6bbfd6da6e74eb578bac903d0ea4af60fc993c97))
-   fixed method to specify schema to be queried for postgres
    db-connections
    ([f54dac6](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f54dac68cba291cf26ecd76207a05fce66f46c14))
-   fixed errorneous sendquery with getquery
    ([dbe9945](https://gitlab.miracum.org/miracum/misc/dizutils/tree/dbe99453364673ff0a6545d106761d745749f318))

#### CI

-   updated gha
    ([f19a542](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f19a542e5db01577b6336fa34ae8204d648673f2))
-   updated gha
    ([d017cc5](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d017cc5b57e7232cde037bf90b775e6fa85b1ba3))

#### Other changes

-   new version v0.1.1
    ([defc7b2](https://gitlab.miracum.org/miracum/misc/dizutils/tree/defc7b2d9af1dcdb3498f11d22119ba2e78d9db6))
-   more informative logging messages
    ([d909994](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d9099949f20b0f12b02b3048e363820a918d51c4))
-   preparing next cran-release
    ([a5f59c5](https://gitlab.miracum.org/miracum/misc/dizutils/tree/a5f59c54d52462f62d317a904f49d904c3bdcd0e))
-   new development version
    ([4d80bb8](https://gitlab.miracum.org/miracum/misc/dizutils/tree/4d80bb8d0349b8a4dc7f1515cd667643514c3eac))
-   updated news.md
    ([cfad461](https://gitlab.miracum.org/miracum/misc/dizutils/tree/cfad461ba87fc78d7d60d36d42c1ef096ca457c1))
-   new CRAN version `v0.1.0`
    ([06753eb](https://gitlab.miracum.org/miracum/misc/dizutils/tree/06753eb50a8b21839366ef5f714b653c47aafa3b))
-   new CRAN release `v0.0.16`
    ([085c95e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/085c95e202bac27bef5edef3684edf4bbe949dc4))
-   updated news.md
    ([8ab139f](https://gitlab.miracum.org/miracum/misc/dizutils/tree/8ab139f620e22d2b4f8fdb213b5de4a292bcca6f))
-   updated rbuildignore
    ([42ef045](https://gitlab.miracum.org/miracum/misc/dizutils/tree/42ef04501c25c27b4803c268190202a9e1719993))
-   updated news.md
    ([448ceee](https://gitlab.miracum.org/miracum/misc/dizutils/tree/448ceeeaff1d397e41fdd2e1e47188e9c9e38bc2))
-   updated devstuffs to get auto-changelog working again
    ([2941a6e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/2941a6eaae92b5073b63dd4e5abe732e13afbce0))
-   updated news md
    ([3de2421](https://gitlab.miracum.org/miracum/misc/dizutils/tree/3de2421b628666942c529a95daf1a988baedddba))
-   preparing cran submission
    ([112eb8e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/112eb8e2d2b78b9f93a0efe281007d5fb34028a6))
-   more informative error msg
    ([823f8ba](https://gitlab.miracum.org/miracum/misc/dizutils/tree/823f8ba456138e53f3747c62cd08295ffa5a6a30))
-   working on sql debugging
    ([58ae013](https://gitlab.miracum.org/miracum/misc/dizutils/tree/58ae013c977d8beb568ce75137d03f70323ef339))
-   reset to working example
    ([53c80b9](https://gitlab.miracum.org/miracum/misc/dizutils/tree/53c80b9720eb27c9aa0eeadd8d6e24a92d7f29fb))
-   added scripts for debugging termination of long sql statements
    ([d204134](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d204134aa52fdb4caa33cc72b97d06e880816f0e))

Full set of changes:
[`v0.0.15...v0.1.1`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.15...v0.1.1)

## v0.0.15 (2022-02-26)

#### Bug fixes

-   removed magrittr as dependency due to cran note
    ([d517436](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d517436e0aae98bd03029f4f1d8e1b6d24aaa75b))
-   switched to `headless = TRUE` in `db_connection()`
    ([e712db6](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e712db6125437be0c39ea44839a26774c23b43b4))

#### Other changes

-   updated description
    ([3356a1f](https://gitlab.miracum.org/miracum/misc/dizutils/tree/3356a1f8cd75cb1c57947d0b90fa9d298cf7b57a))

Full set of changes:
[`v0.0.14...v0.0.15`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.14...v0.0.15)

## v0.0.14 (2022-02-21)

#### Breaking changes

-   removed deprecated functions BREAKING CHANGE: use DIZtools as dep
    ([5895d6c](https://gitlab.miracum.org/miracum/misc/dizutils/tree/5895d6cfbf71154e4cd5fd721e7f8f1609c87ab4))

#### Refactorings

-   removed functions already implemented in diztools
    ([e339918](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e33991811a1149f7b76b99cab18a43ec53828879))
-   removed dependency from diztools
    ([91959f7](https://gitlab.miracum.org/miracum/misc/dizutils/tree/91959f77d5c6af862e7a6752088d65e016ab197f))
-   re-introduced close\_all\_connections
    ([54cc167](https://gitlab.miracum.org/miracum/misc/dizutils/tree/54cc167673120516dc8f1a0cfe70b2648958d203))

#### Other changes

-   updated gitignore
    ([fbdd332](https://gitlab.miracum.org/miracum/misc/dizutils/tree/fbdd332c05f19d40f857bdca95ea1dfaab7f8237))

Full set of changes:
[`v0.0.13...v0.0.14`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.13...v0.0.14)

## v0.0.13 (2022-02-11)

#### Bug fixes

-   removed deprecation of get\_config; updated news.md, updated
    description
    ([f7523b2](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f7523b2a7bbe8e61165e7df404e7e6cc5773350d))
-   managing deprecations due to ditzools on cran; add dep diztools
    ([e3272b4](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e3272b4d7b5f33aeb0c5fd13385d33fc2c72874a))
-   corrected references and function outsources
    ([9795381](https://gitlab.miracum.org/miracum/misc/dizutils/tree/97953810a371b80377953a1bb3fa6e93f293da3c))
-   updated function call according to diztools
    ([6ddd482](https://gitlab.miracum.org/miracum/misc/dizutils/tree/6ddd48211737af24c5dac6317a0511013736968a))
-   further adjustments to depend now on diztools, which seems to work
    now
    ([4c58a55](https://gitlab.miracum.org/miracum/misc/dizutils/tree/4c58a558c13e961be9e1b006cd8aa9ba9ef9ad26))
-   first attempts to connect to diztools; not working yet
    ([ff868f6](https://gitlab.miracum.org/miracum/misc/dizutils/tree/ff868f6d07864c24ae33b66c4fb2c66fb603f934))

#### Docs

-   added .deprecated to function calls for migration to diztools
    ([cdced93](https://gitlab.miracum.org/miracum/misc/dizutils/tree/cdced93e51ce2b95888467d66661995ed80d92bf))
-   reset cran comments
    ([43cd1cc](https://gitlab.miracum.org/miracum/misc/dizutils/tree/43cd1cce52b6491200d92bb92f77d92b30ec79e4))

#### Other changes

-   updated cran comments
    ([d451502](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d451502b6d7fb383dd7d4c3280af0efe1e7e0740))
-   updated description and news.md
    ([0329c96](https://gitlab.miracum.org/miracum/misc/dizutils/tree/0329c9695fb368200cc56c6b6fa7f9debd91e43c))
-   removed deprecation of notin due to extensive usage in dqastats
    ([adad18b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/adad18b8198ea82ec092138cb6dd2d76f54b28a0))

Full set of changes:
[`v0.0.12...v0.0.13`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.12...v0.0.13)

## v0.0.12 (2022-02-04)

#### Bug fixes

-   added normalize path and magrittr pipe
    ([353c4a4](https://gitlab.miracum.org/miracum/misc/dizutils/tree/353c4a44f65f04a245ce9265fbc1a68954bdad81))
-   fixed path concatenation for logfiles
    ([ffbb981](https://gitlab.miracum.org/miracum/misc/dizutils/tree/ffbb9813dc2c6f6328c46f73142713c9f01ad4c2))
-   replace paste with file.path for contactating file paths
    ([e379ab6](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e379ab675811ffe387289e29d27d835a712c0c13))

#### Tests

-   added unit test for feedback function
    ([30eddc7](https://gitlab.miracum.org/miracum/misc/dizutils/tree/30eddc72075f111106a642440056f676edf7eb33))

#### Docs

-   revised rep2 documentation
    ([9951664](https://gitlab.miracum.org/miracum/misc/dizutils/tree/9951664cc4c0ad1252a748c1ca748b6abe6f0618))

#### Other changes

-   updated news.md
    ([37b357e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/37b357e6063d463c01dbfb8ce9decf85054a5977))
-   updated news.md and cran-comments
    ([a5a27a7](https://gitlab.miracum.org/miracum/misc/dizutils/tree/a5a27a7e3f133299b4005d19fd642dfa47bdb315))
-   updated cran comments
    ([a39c6a6](https://gitlab.miracum.org/miracum/misc/dizutils/tree/a39c6a672d00e0a95b8e313bb3facd81e5e93b79))
-   moving db-dependencies back to imports
    ([b0b7171](https://gitlab.miracum.org/miracum/misc/dizutils/tree/b0b7171f123c82c62153a12568ef8353df4e336a))
-   moved news.md to .rbuildignore
    ([9c6d85e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/9c6d85eaf6502ce24bf420755f48f609a8542b1b))

Full set of changes:
[`v0.0.11...v0.0.12`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.11...v0.0.12)

## v0.0.11 (2022-02-01)

#### New features

-   added close\_connection wrapper function
    ([34707c5](https://gitlab.miracum.org/miracum/misc/dizutils/tree/34707c52988ae3b38ce7cadbea24afaf29e28eee))
-   added update script for `NEWS.md`
    ([9f7590a](https://gitlab.miracum.org/miracum/misc/dizutils/tree/9f7590a045acd752acaa5c8c9c7586484639536c))
-   added function `rep2`
    ([30a7d9e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/30a7d9e1fb97da6028f634ca789fceccb5c1b134))
-   added `setenv2` as function
    ([de4738d](https://gitlab.miracum.org/miracum/misc/dizutils/tree/de4738ddd67960cc7d22b3c3a024607b660a10d5))

#### Docs

-   updated copyright to 2022
    ([45ceca3](https://gitlab.miracum.org/miracum/misc/dizutils/tree/45ceca3a0424467fe3c59d591c8ba79e3114d3ab))

#### Other changes

-   updated news.md
    ([54a9658](https://gitlab.miracum.org/miracum/misc/dizutils/tree/54a96580dd6016ab4cdc191a43a2de06dc94d4da))
-   merge development
    ([acb7700](https://gitlab.miracum.org/miracum/misc/dizutils/tree/acb77005482d59d4138656b20035ee2c3c7e8439))
-   updated buildignore
    ([eb35034](https://gitlab.miracum.org/miracum/misc/dizutils/tree/eb350340d357f6e04808df5ec178b83811d06c59))
-   new cran version
    ([5824cb8](https://gitlab.miracum.org/miracum/misc/dizutils/tree/5824cb87532e59ff817b28b3ab0c696d7d926ec3))

Full set of changes:
[`v0.0.9...v0.0.11`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.9...v0.0.11)

## v0.0.9 (2021-12-08)

#### New features

-   added possibility to assign more than one system in the env
    ([3286763](https://gitlab.miracum.org/miracum/misc/dizutils/tree/3286763eb4c762b3f7bd3e66be5b08acb46276f3))
-   added argument to close connections after db call
    ([e95d6e8](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e95d6e8c404ef50296054f15ace9dc954af25cac))

#### Bug fixes

-   added connection closing after querying the db
    ([f0ca921](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f0ca9217fb164d77d8522f8c06216671e57c5c4e))
-   fixed gh actions
    ([34487b9](https://gitlab.miracum.org/miracum/misc/dizutils/tree/34487b9a58197efb52378d4dcf3899c0e3af5ccd))

#### Refactorings

-   fixed ci test lints
    ([fd5352a](https://gitlab.miracum.org/miracum/misc/dizutils/tree/fd5352a91edd57c02293d6c21764606b60495f8d))
-   fixing ci tests
    ([25c1bf2](https://gitlab.miracum.org/miracum/misc/dizutils/tree/25c1bf288481e7563f672f151f8e73fa1c0f4289))
-   fixing ci tests
    ([30e328c](https://gitlab.miracum.org/miracum/misc/dizutils/tree/30e328c9a1b62c40b8c94fb8ebf15cf938967e88))
-   fixing ci tests
    ([37733d1](https://gitlab.miracum.org/miracum/misc/dizutils/tree/37733d1d148deddeed878926ad0ece08338ce909))

#### Docs

-   updated man
    ([25eafac](https://gitlab.miracum.org/miracum/misc/dizutils/tree/25eafac01562a1264742191456f036500fc18063))

#### Other changes

-   fixed ci lints
    ([9292091](https://gitlab.miracum.org/miracum/misc/dizutils/tree/9292091f11038774378a1ede090d3bd6659512b2))
-   removed lagacy code
    ([7b370fc](https://gitlab.miracum.org/miracum/misc/dizutils/tree/7b370fcbe12913ab00a386f66fe89d6147d2ca39))
-   added libs for rjava
    ([947103e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/947103e9ba818371f00349d1398166c909b04886))

Full set of changes:
[`v0.0.8...v0.0.9`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.8...v0.0.9)

## v0.0.8 (2021-05-25)

#### New features

-   added `is_date_format()` function
    ([7dce60f](https://gitlab.miracum.org/miracum/misc/dizutils/tree/7dce60fe0b3e6f0793863cd063aee83bfe48d48b))
-   added function `equals2`
    ([512c034](https://gitlab.miracum.org/miracum/misc/dizutils/tree/512c034fcb02d267881f8b3e4f87e40b01661fe8))
-   added `no_return` as parameter to `query_database`
    ([7b0dbec](https://gitlab.miracum.org/miracum/misc/dizutils/tree/7b0dbecac58fa66c553fc1f4beca7ff64943739d))
-   added new function `format_POSIXct`
    ([346c43c](https://gitlab.miracum.org/miracum/misc/dizutils/tree/346c43cd4d194f3c3bfebb15e58425b2690977d2))
-   added `check_if_table_exists` function
    ([40cf933](https://gitlab.miracum.org/miracum/misc/dizutils/tree/40cf9332a9711ea3a56db43c948cbfc9877052c7))

#### Bug fixes

-   :ambulance: changed `db_name` to `system_name`
    ([694d4c9](https://gitlab.miracum.org/miracum/misc/dizutils/tree/694d4c948b7340948eea16b5a1af94e02b483134))
-   db\_name was interpreted false
    ([a72bd64](https://gitlab.miracum.org/miracum/misc/dizutils/tree/a72bd64065b8523c43b05ffd2f2269718828e27b))

#### Refactorings

-   optimzied `db_connection` to allow minimal inputs only
    ([0a4991b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/0a4991bb32b505f2733a765e2c466af036aee718))

#### CI

-   switched to central gitlab-ci.yml
    ([408cc0f](https://gitlab.miracum.org/miracum/misc/dizutils/tree/408cc0fc8bd6aedb02ab5b22727d82bcc189688f))
-   added previous install step to test-pipeline
    ([8836661](https://gitlab.miracum.org/miracum/misc/dizutils/tree/88366616af9738a3c011b2b2f62d5688b4b6c45b))
-   added previous install step to test-pipeline
    ([a514877](https://gitlab.miracum.org/miracum/misc/dizutils/tree/a514877515217d76515d0a266a3a3b5a85f9d291))
-   updated gitlab-ci to use the base image
    ([fa52b1b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/fa52b1bd9d9680462a35fe8336d1070ad4573cd3))

#### Docs

-   fixed manual of `query_database()`
    ([5b0ea2b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/5b0ea2b48ff61ca4dc8dfd17805c8b8f0577992e))
-   fixed escaping error in manual
    ([77c2787](https://gitlab.miracum.org/miracum/misc/dizutils/tree/77c278784ccedaa54675665ff57299691c53cfe8))
-   updated manual
    ([9632404](https://gitlab.miracum.org/miracum/misc/dizutils/tree/9632404164b2c9334d92a9aa0b5f8130c80ba225))
-   updated DESCRIPTION
    ([b2d7e25](https://gitlab.miracum.org/miracum/misc/dizutils/tree/b2d7e2580fdb19462d92e92704e2c97bc2ce7297))
-   updated readme for new parameter of `db_connection`
    ([c78338b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/c78338bb7f8567b64b0b38c3e11a0f330ae74b73))

#### Other changes

-   improvement of feedback function-feedback
    ([99c08e5](https://gitlab.miracum.org/miracum/misc/dizutils/tree/99c08e560bb377663689fa1277489e6a0b1f81ff))
-   added `parsedate` as import
    ([4163516](https://gitlab.miracum.org/miracum/misc/dizutils/tree/416351655de02f986f1b4b5c63326a250668ca23))
-   added explicit parameter calls
    ([bccaa2e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/bccaa2e9807cc44caf8844f2457bd911afb3d7a8))

Full set of changes:
[`v0.0.7...v0.0.8`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.7...v0.0.8)

## v0.0.7 (2021-02-11)

#### New features

-   added `clear` function
    ([1b3a143](https://gitlab.miracum.org/miracum/misc/dizutils/tree/1b3a143bc44d0270beaf83d5d7e3ce7d9b5608d2))
-   added function `string_replacements`
    ([5a901d5](https://gitlab.miracum.org/miracum/misc/dizutils/tree/5a901d5b92eb51e0da535cb1eaa437a09bbe6916))
-   added function `combine_stats`
    ([7ab9d58](https://gitlab.miracum.org/miracum/misc/dizutils/tree/7ab9d585138dd5550d7eb24bfdf2ced8a9ff4720))
-   added function `xml_2_json`
    ([74aacad](https://gitlab.miracum.org/miracum/misc/dizutils/tree/74aacad316d61d805e387523b14b7c49d87494dd))
-   enhanced `clean_path_name` and `get_config_env`
    ([86358c0](https://gitlab.miracum.org/miracum/misc/dizutils/tree/86358c0d85fc65a299c3c876b24fba71c537165d))
-   added function `setdiff_all`
    ([e316479](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e3164794b40ecb9df20d05875364a811f68cedf1))
-   added “get\_db\_systems” and “get\_current\_timestamp” functions
    ([32ee30e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/32ee30e9c296f8a8a988e7fcdf670b88ac107549))
-   added function `get_current_timestamp`
    ([d0a82da](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d0a82da34728718d8795da2a5e225b4516c7a061))

#### Bug fixes

-   fixed bug where `feeback` function uses a missing argument for
    `headless` or `logfile_dir`
    ([4ba9856](https://gitlab.miracum.org/miracum/misc/dizutils/tree/4ba9856d1615b3e86073c1c427912a5e4b908cf6))
-   fixed feedback function to also work with empty or NULL logfile\_dir
    ([d76f673](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d76f6734a15dcd88251e33ebea7d76d48f59d59e))
-   bugfix in get\_config\_env where the name of the named list was
    wrong
    ([d937419](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d9374190c81f86d4738e1103e82f4d246512acc3))

#### Refactorings

-   preparing for new release
    ([baeb0d1](https://gitlab.miracum.org/miracum/misc/dizutils/tree/baeb0d14521429c97a645af1022fe11ffc71fafc))
-   preparation for new release
    ([6181a97](https://gitlab.miracum.org/miracum/misc/dizutils/tree/6181a978c0f94f72a1d0977c8e49b5fe7dba936e))
-   preparation for new release
    ([e4e9a55](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e4e9a55f99f369b08bcf6634b9ac24bb92bd4140))
-   adadpted demo url for dockerfile for jdbc drivers
    ([5108f62](https://gitlab.miracum.org/miracum/misc/dizutils/tree/5108f62b96f32961f988edd7a86c90aa667f78f4))
-   added rubstness to `db_connection` function
    ([10a2593](https://gitlab.miracum.org/miracum/misc/dizutils/tree/10a259399c558ff1b5236293935481742d250ef6))
-   more robust functions
    ([0b196d1](https://gitlab.miracum.org/miracum/misc/dizutils/tree/0b196d1c733df27ed1372f7a728452a385825898))
-   added check for completeness of input variables for `db_connection`
    function
    ([95acd77](https://gitlab.miracum.org/miracum/misc/dizutils/tree/95acd77095a1c63704f396b2bfb190a37e9424dd))
-   made arguments `headless` in functions `feedback_to_ui` and
    `feedback_to_console` optional
    ([592d8a6](https://gitlab.miracum.org/miracum/misc/dizutils/tree/592d8a61dfda39ec10de8b45a042de5983174ba1))
-   added `tolower` and `toupper` to function `string_replacements`
    ([ff41a43](https://gitlab.miracum.org/miracum/misc/dizutils/tree/ff41a431b6e2a163e0f3c12d74576d2fd7e9779c))
-   optimized screen texts for combine\_stats demo
    ([f3ac827](https://gitlab.miracum.org/miracum/misc/dizutils/tree/f3ac8271951fc96be6d1057bcd0608e982626996))

#### Docs

-   updated readme
    ([d3350c7](https://gitlab.miracum.org/miracum/misc/dizutils/tree/d3350c780aececdbe29f0eb453c543cdc507690b))
-   updated news.md
    ([8ad31c4](https://gitlab.miracum.org/miracum/misc/dizutils/tree/8ad31c4fef8bd8a896dd02e84ecdb406bbad3e7f))
-   updated manual files
    ([691c3c3](https://gitlab.miracum.org/miracum/misc/dizutils/tree/691c3c3abff3611f2f549cb20ff41b567df8d79e))
-   updated `news.md`
    ([05b5d66](https://gitlab.miracum.org/miracum/misc/dizutils/tree/05b5d66ae6dc4f3bdfecec419ac279d5b753319e))
-   updated `news.md`
    ([60f55d1](https://gitlab.miracum.org/miracum/misc/dizutils/tree/60f55d1f8679f7efffba09d1a0f7be8bf19992d3))
-   updated news.md
    ([bfd5f7e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/bfd5f7e8e0c2852d343b98e10e0a9b485a391f20))
-   updated news.md
    ([c3518b9](https://gitlab.miracum.org/miracum/misc/dizutils/tree/c3518b9822d855fb1bbfb091c804493a403a95f6))
-   updated news.md
    ([2d5cef2](https://gitlab.miracum.org/miracum/misc/dizutils/tree/2d5cef219b70d7d0242f846f46244ebabb7da6aa))
-   styl md
    ([9cbc20d](https://gitlab.miracum.org/miracum/misc/dizutils/tree/9cbc20d7a32d856070dcb027470218aa5d5f53cf))
-   fixed md style
    ([53e1c0e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/53e1c0e1800d374685ef65e01a9a4355e70bb434))

#### Style

-   readme linting
    ([dc883c8](https://gitlab.miracum.org/miracum/misc/dizutils/tree/dc883c8a5280038b2e726722b1053fe9df449595))

Full set of changes:
[`v0.0.6...v0.0.7`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.6...v0.0.7)

## v0.0.6 (2020-11-17)

#### Bug fixes

-   removed console prints from debugging
    ([08f0f1b](https://gitlab.miracum.org/miracum/misc/dizutils/tree/08f0f1bc5a4554c541cdf9f4429d6c6340215e2a))
-   fixed oracle and postrges connection setup
    ([e45c420](https://gitlab.miracum.org/miracum/misc/dizutils/tree/e45c420c06825f41511b44c5b824a896211ee8ce))

#### Refactorings

-   added system requirements for cran checks
    ([52d9eee](https://gitlab.miracum.org/miracum/misc/dizutils/tree/52d9eee3b17a64cbc790480e8db6fbe9e5bc0ffd))

#### Docs

-   updated description; added cran-comments
    ([0664f3e](https://gitlab.miracum.org/miracum/misc/dizutils/tree/0664f3efd89bf48116a29f6b204b63c1dcc459dc))
-   added changelog
    ([532ad76](https://gitlab.miracum.org/miracum/misc/dizutils/tree/532ad761168148de50f7f8484b2518a04cf296fb))

Full set of changes:
[`v0.0.5...v0.0.6`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.5...v0.0.6)

## v0.0.5 (2020-09-14)

Full set of changes:
[`v0.0.4...v0.0.5`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.4...v0.0.5)

## v0.0.4 (2020-06-04)

Full set of changes:
[`v0.0.3...v0.0.4`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.3...v0.0.4)

## v0.0.3 (2020-05-07)

Full set of changes:
[`v0.0.2...v0.0.3`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/v0.0.2...v0.0.3)

## v0.0.2 (2020-04-20)

Full set of changes:
[`7d31d70...v0.0.2`](https://gitlab.miracum.org/miracum/misc/dizutils/compare/7d31d70...v0.0.2)
