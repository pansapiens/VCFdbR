
getConnection <- function(db_type, db_name, host="localhost", port=5432, username="postgres", password=NA) {
  if (db_url != "" && !is.na(db_url)) {
    con <- dbx::dbxConnect(url=db_url)
  } else if (db_type == "postgres") {
    con <- dbConnect(RPostgres::Postgres(), dbname=db_name, 
                     host=host, port=port, user=username, password=password)
  } else if (db_type == "sqlite") {
    con <- dbConnect(SQLite(), dbname=db_name)
  } else {
    # raise error, unknown db type
    stop(paste0("Unknown database type: ", db_type))
  }
  return(con)
}

# this converts INFO prefixes that start with digits to
# the name used by the database/tibbles upon import
# fixVcfAnnoKey <- function(key) {
#   if (str_detect(key, regex('^[0-9]'))) {
#     return(paste0('x', key))
#   }
#   return(key)
# }