# movieDatabase

This is a movie database created from https://www.w3resource.com/sql-exercises/ movie database structure.
The database is uploaded with data from files. Also, 3 additional tables were created to track How many movies were released during a year, 
How many actors played in a movie, and How many different genres of movies were released. 
Also these 3 tables get updated automatically if data is added or deleted from related tables. Also there is an additional query written.

1. If PostgreSQL is not installed, first you should download and install it via this link https://www.postgresql.org/download/
2. You should start PostgreSQL server
3. Open the terminal and connect to the database with this command <strong>psql postgres://yourPcName@localhost:5432/yourPcName</strong>
  you should change 'yourPcName" to your computer name
4. After you should paste this command and <strong>CREATE DATABASE movies;</strong>
5. Connect to movies database using this command <strong>\c movies;</strong>
6. Then copy and paste sql queries to the terminal from files. Order of files:
  <li><strong>createDatabse.sql</strong></li>
  <li><strong>populateDatabase.sql</strong></li>
  <li><strong>createAndUpdateMovieCount.sql</strong></li>
  <li><strong>createAndUpdateActorCount.sql</strong></li>
  <li><strong>createAndUpdateGenreCount.sql</strong></li>
  <li><strong>nameOfReviewersQuery.sql</strong></li>
