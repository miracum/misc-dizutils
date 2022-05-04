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


very_long_query <- "SELECT
r1.id AS \"Fall.Einrichtungskontakt.Aufnahmenummer\",
r2.code AS \"Laborbefund.Laboruntersuchung.Code\"
FROM (
SELECT
jsonbdata ->> 'id' AS id,
fhir_start_date
FROM (
SELECT
to_timestamp(jsonb_path_query(DATA, '$.period') ->> 'start', 'YYYY-MM-DDTHH:MI:SS') AS fhir_start_date,
DATA AS jsonbdata
FROM resources
--WHERE TYPE = 'Encounter') AS r_intermediate) r1, LATERAL (
WHERE TYPE = 'Encounter') AS r_intermediate WHERE r_intermediate.fhir_start_date = '2020-01-01') r1
LEFT JOIN (
SELECT
cd_system ->> 'code' AS code,
REPLACE(jsonbdata2 -> 'encounter' ->> 'reference', 'Encounter/', '') AS id
FROM (
SELECT
DATA AS jsonbdata2,
jsonb_array_elements(jsonb_path_query(DATA, '$.code.coding')) AS cd_system,
jsonb_array_elements(jsonb_path_query(DATA, '$.category.coding')) AS cd_category
FROM resources
WHERE TYPE = 'Observation') AS r3
WHERE r3.cd_system ->> 'system' = 'http://loinc.org' AND
r3.cd_category ->> 'code' = '26436-6'
) r2
ON r1.id = r2.id;"


simple_sql <- "SELECT
fhir_id AS \"Fall.Einrichtungskontakt.Aufnahmenummer\",
fhir_start_date AS \"Fall.Einrichtungskontakt.Beginndatum\"
FROM (
SELECT * FROM (
SELECT
fhir_id,
to_timestamp(jsonb_path_query(DATA, '$.period') ->> 'start', 'YYYY-MM-DDTHH:MI:SS') AS fhir_start_date
FROM resources
WHERE TYPE = 'Encounter') AS r_intermediate LIMIT 100 ) r1;"


db_con <- db_connection(
  system_name = system_name,
  db_type = "postgres"
)


#dat2 <- query_database(db_con, sql_statement = very_long_query)
# Error while executing SQL-query: Error: Failed to fetch row: SSL SYSCALL error: EOF detected
dat2 <- query_database(db_con, sql_statement = simple_sql)

close_connection(db_con)



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
