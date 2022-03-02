DIZtools::setenv_file(env_file = "../../dqa/env_INTERNAL")
devtools::load_all()

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

system.time({
  Sys.time() |> print()
  res <- pool::dbGetQuery(conn = db_con, statement = sql_statement)
  Sys.time() |> print()
})


RPostgres::dbFetch(res, n = 2)

close_connection(db_con)
