# Artificial Grammar Learning, Neural Networks, and Major Transitions in the Evolution of Cognition

This project is organised using the `DrWatson.jl` package (see [here](https://juliadynamics.github.io/DrWatson.jl/stable/)). To reproduce the project in full, do the following:

1. Clone this repository and run the following in `julia` with the path to this project (activate the package manager using `]`):
   ```julia
    julia> cd("path/to/this/project")
    pkg> activate .
    pkg> instantiate
   ```
2. Install MySQL and set up a user with read/write privileges.
3. Fill out `./src/database_connection.csv` with your database details. Use `./src/user_database_connection.csv` as a template.


## MySQL Set Up

1. Install MySQL for your system.
2. Start the mysql service.
3. Set a root password (best practice) using `mysqladmin -u root password`. It will then ask you to enter and then confirm your password.
4. Run mysql in your terminal as root using `mysql -u root -p`.
5. Create a user by running the line below. Remember to change the username, host, and password, and store them in a copy of the `user_database_connection.csv` file, renamed to be `database_connection.csv` (this will be gitignored).
```sql
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
```
6. Grant privileges to this user. The below code grants _all_ privileges on the user. Note that you should only do this for a local database. Replace `ALL` with a comma-delimited list of privileges (e.g., `CREATE`, `ALTER`, `DROP`) that you want to grant. See [here for a full list of privileges](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html#privileges-provided-summary). You will need at least `ALTER, CREATE, DELETE, DROP, INSERT, SELECT, UPDATE`. Note that `WITH GRANT OPTION` also grants the privilege to grant other users with this user's privileges.
```sql
GRANT ALL ON *.* TO 'username'@'host' WITH GRANT OPTION;
```
7. Run `FLUSH PRIVILEGES` to reload grant tables and put privileges into effect.
8. Verify the privileges of the user by running: `SHOW GRANTS FOR 'username'@'host';`
9. Exit root with `exit` and then log into your new user with `mysql -u username -p` in the terminal.

Run `CREATE DATABASE databasename;` in root (or in your user if it has the right privileges) and store the databasename in `database_connection.csv`.

It is also handy to have MySQL Workbench for easy data inspection.