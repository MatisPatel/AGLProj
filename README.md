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