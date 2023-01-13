using Distributed 
# addprocs(4)

@everywhere begin
    using MySQL
end

println("Opening DB Connection")

@everywhere dbName = "model"
@everywhere connection = DBInterface.connect(MySQL.Connection, "localhost","username", "password", db = dbName)

# on worker 2
@sync @distributed for i in 1:10
    query = string("INSERT INTO dummy (number) VALUES(", myid()+10+i,")")
    DBInterface.execute(connection, query)
end
