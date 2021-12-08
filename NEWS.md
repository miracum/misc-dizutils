# [](https://gitlab.miracum.org/miracum/misc/dizutils/-/compare/v0.0.6...v) (2021-02-11)


### docs

* fixed md style ([53e1c0e](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/53e1c0e1800d374685ef65e01a9a4355e70bb434))
* updated `news.md` ([05b5d66](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/05b5d66ae6dc4f3bdfecec419ac279d5b753319e))
* updated `news.md` ([60f55d1](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/60f55d1f8679f7efffba09d1a0f7be8bf19992d3))
* updated manual files ([691c3c3](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/691c3c3abff3611f2f549cb20ff41b567df8d79e))
* docs: ([8417003](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/841700333b4b23863e8fa02b5575f3b58d858c14))
* styl md ([9cbc20d](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/9cbc20d7a32d856070dcb027470218aa5d5f53cf))
* updated news.md ([bfd5f7e](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/bfd5f7e8e0c2852d343b98e10e0a9b485a391f20))
* updated news.md ([c3518b9](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/c3518b9822d855fb1bbfb091c804493a403a95f6))
* updated news.md ([2d5cef2](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/2d5cef219b70d7d0242f846f46244ebabb7da6aa))

### feat

* added "get_db_systems" and "get_current_timestamp" functions ([32ee30e](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/32ee30e9c296f8a8a988e7fcdf670b88ac107549))
* added `clear` function ([1b3a143](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/1b3a143bc44d0270beaf83d5d7e3ce7d9b5608d2))
* added function `combine_stats` ([7ab9d58](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/7ab9d585138dd5550d7eb24bfdf2ced8a9ff4720))
* added function `get_current_timestamp` ([d0a82da](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/d0a82da34728718d8795da2a5e225b4516c7a061))
* added function `setdiff_all` ([e316479](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/e3164794b40ecb9df20d05875364a811f68cedf1))
* added function `string_replacements` ([5a901d5](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/5a901d5b92eb51e0da535cb1eaa437a09bbe6916))
* added function `xml_2_json` ([74aacad](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/74aacad316d61d805e387523b14b7c49d87494dd))
* enhanced `clean_path_name` and `get_config_env` ([86358c0](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/86358c0d85fc65a299c3c876b24fba71c537165d))

### fix

* bugfix in get_config_env where the name of the named list was wrong ([d937419](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/d9374190c81f86d4738e1103e82f4d246512acc3))
* fixed bug where `feeback` function uses a missing argument for `headless` or `logfile_dir` ([4ba9856](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/4ba9856d1615b3e86073c1c427912a5e4b908cf6))
* fixed feedback function to also work with empty or NULL logfile_dir ([d76f673](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/d76f6734a15dcd88251e33ebea7d76d48f59d59e))

### refactor

* adadpted demo url for dockerfile for jdbc drivers ([5108f62](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/5108f62b96f32961f988edd7a86c90aa667f78f4))
* added `tolower` and `toupper` to function `string_replacements` ([ff41a43](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/ff41a431b6e2a163e0f3c12d74576d2fd7e9779c))
* added check for completeness of input variables for `db_connection` function ([95acd77](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/95acd77095a1c63704f396b2bfb190a37e9424dd))
* added rubstness to `db_connection` function ([10a2593](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/10a259399c558ff1b5236293935481742d250ef6))
* made arguments `headless` in functions `feedback_to_ui` and `feedback_to_console` optional ([592d8a6](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/592d8a61dfda39ec10de8b45a042de5983174ba1))
* more robust functions ([0b196d1](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/0b196d1c733df27ed1372f7a728452a385825898))
* optimized screen texts for combine_stats demo ([f3ac827](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/f3ac8271951fc96be6d1057bcd0608e982626996))
* preparation for new release ([6181a97](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/6181a978c0f94f72a1d0977c8e49b5fe7dba936e))
* preparation for new release ([e4e9a55](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/e4e9a55f99f369b08bcf6634b9ac24bb92bd4140))

### style

* readme linting ([dc883c8](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/dc883c8a5280038b2e726722b1053fe9df449595))



## [0.0.6](https://gitlab.miracum.org/miracum/misc/dizutils/-/compare/v0.0.4...v0.0.6) (2020-11-17)


### docs

* added changelog ([532ad76](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/532ad761168148de50f7f8484b2518a04cf296fb))
* updated description; added cran-comments ([0664f3e](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/0664f3efd89bf48116a29f6b204b63c1dcc459dc))

### fix

* fixed oracle and postrges connection setup ([e45c420](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/e45c420c06825f41511b44c5b824a896211ee8ce))
* removed console prints from debugging ([08f0f1b](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/08f0f1bc5a4554c541cdf9f4429d6c6340215e2a))

### refactor

* added system requirements for cran checks ([52d9eee](https://gitlab.miracum.org/miracum/misc/dizutils/-/commit/52d9eee3b17a64cbc790480e8db6fbe9e5bc0ffd))



## [0.0.4](https://gitlab.miracum.org/miracum/misc/dizutils/-/compare/v0.0.3...v0.0.4) (2020-06-04)




## [0.0.3](https://gitlab.miracum.org/miracum/misc/dizutils/-/compare/v0.0.2...v0.0.3) (2020-05-07)




## 0.0.2 (2020-04-20)



