# World Cup Database Project

This project establishes a relational database containing match results from the 2014 and 2018 FIFA World Cup tournaments. It includes the database schema definition, data insertion script, and a shell script to execute various SQL queries against the stored data. It was developed as part of the freeCodeCamp Relational Database Certification.

## Features

- **Relational Schema:** Defines two tables, teams and games, with appropriate primary and foreign keys.

- **Data Insertion:** A Bash script (insert_data.sh) to populate the tables from a CSV file, ensuring only unique team names are stored in the teams table.

- **Query Script:** A Bash script (queries.sh) to perform various analytical and retrieval queries on the database.

- **PostgreSQL:** Utilizes PostgreSQL as the database management system.

## Technologies

- PostgreSQL, SQL
- Bash Shell Scripting

## Project Structure

- **worldcup.sql** : Defines the PostgreSQL database schema (teams and games tables) and inserts the initial data.

- **insert_data.sh** : Bash script for reading the games.csv file and inserting unique teams and game data into the database.

- **queries.sh** : Bash script containing several analytical SQL queries to extract information from the database.

## Key Database Queries

The following are examples of the analytical queries executed by queries.sh:

- Total number of goals scored by winning teams.
```
SELECT SUM(winner_goals) FROM games;
```

- Winner of the 2018 tournament team name.
```
SELECT name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE year=2018 AND round='Final';
```

- List of teams who played in the 2014 'Eighth-Final' round.
```
SELECT DISTINCT t.name FROM games g JOIN teams t ON t.team_id = g.winner_id OR t.team_id = g.opponent_id WHERE g.year = 2014 AND g.round = 'Eighth-Final';
```