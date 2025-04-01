# script to check data health
# usage: Rscript healthcheck.R

#" @export

database.connect <- function(csv.name, dbPort = 3306){
    here::i_am("src/database.R")
    database_connection <- utils::read.csv(paste0("./src/", csv.name))

    dbName = database_connection$Value[1]
    dbUsername = database_connection$Value[2]
    dbPassword = database_connection$Value[3]
    dbHostname = database_connection$Value[4]

    myDB <- DBI::dbConnect(RMariaDB::MariaDB(), 
                           user = dbUsername, 
                           password = dbPassword, 
                           dbname = dbName, 
                           host = dbHostname, 
                           port = dbPort)
    return(myDB)
}