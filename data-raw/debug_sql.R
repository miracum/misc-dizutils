DIZtools::setenv_file(env_file = "../../dqa/env_INTERNAL")
devtools::load_all()
library(magrittr)

system_name = "fhir_gw"

sql_statement <- "SELECT r1.pid AS \"Person.PatientIn.Patienten-Identifikator.Patienten-Identifikator\", r2.jsonbdata2 ->> 'gender' AS \"Person.Demographie.AdministrativesGeschlecht\"
FROM
( SELECT * FROM ( SELECT REPLACE(jsonb_path_query(DATA, '$.subject') ->> 'reference', 'Patient/', '') AS pid, to_timestamp(jsonb_path_query(DATA, '$.period') ->> 'start', 'YYYY-MM-DDTHH:MI:SS') AS fhir_start_date
FROM resources WHERE TYPE = 'Encounter') AS r_intermediate
WHERE r_intermediate.fhir_start_date >= '2021-02-28' AND r_intermediate.fhir_start_date <= '2021-03-01 23:59:59' ) r1,
LATERAL ( SELECT DATA AS jsonbdata2 FROM resources WHERE TYPE = 'Patient' AND ( (DATA ->> 'id') = r1.pid) ) r2;"

db_con <- db_connection(
  system_name = system_name,
  db_type = "postgres"
)

sql_2 <- "
SELECT * FROM ( SELECT REPLACE(jsonb_path_query(DATA, '$.subject') ->> 'reference', 'Patient/', '') AS pid, to_timestamp(jsonb_path_query(DATA, '$.period') ->> 'start', 'YYYY-MM-DDTHH:MI:SS') AS fhir_start_date
FROM resources WHERE TYPE = 'Encounter') AS r_intermediate
WHERE r_intermediate.fhir_start_date >= '2021-02-28' AND r_intermediate.fhir_start_date <= '2021-03-01 23:59:59'
"

# system.time({
#   Sys.time() |> print()
#   res <- RPostgres::dbSendQuery(conn = db_con, statement = sql_statement, statement_timeout = 0)
#   Sys.time() |> print()
# })
#
#
#
# RPostgres::dbFetch(res, n = 1000)
#
# dat <- RPostgres::dbFetch(res, n = -1) %>%
#   data.table::data.table(stringsAsFactors = FALSE)
#
# RPostgres::dbClearResult(res)


dat2 <- query_database(db_con, sql_statement = sql_statement)

close_connection(db_con)






# https://www.postgresqltutorial.com/postgresql-python/query/
connect <- reticulate::import(
  "psycopg2",
  delay_load = FALSE
)

settings <- load_settings_from_env(
  system_name_uppercase = "FHIR_GW"
)

conn <- connect$connect(
  dbname = settings$dbname,
  host = settings$host,
  port = settings$port,
  user = settings$user,
  password = settings$password
)

cur <- conn$cursor()

system.time({
  Sys.time() |> print()
  cur$execute(sql_statement)
  Sys.time() |> print()
})

dat <- cur$fetchall() %>% data.table::data.table(dat, stringsAsFactors = TRUE)
cur$close()
conn$close()
