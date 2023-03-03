psql -h localhost -p 5432 -U postgres -d postgress

CREATE DATABASE movies;

\c movies;

CREATE TABLE actor (
    act_id INTEGER PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);

CREATE TABLE movie (
    mov_id INTEGER PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INTEGER,
    mov_time INTEGER,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);

CREATE TABLE reviewer (
    rev_id INTEGER PRIMARY KEY,
    rev_name CHAR(30)
);

CREATE TABLE genres (
    gen_id INTEGER PRIMARY KEY,
    gen_title CHAR(20)
);

CREATE TABLE director (
    dir_id INTEGER PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);

CREATE TABLE movie_cast (
    act_id INTEGER,
    mov_id INTEGER,
    role CHAR(30),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_direction (
    dir_id INTEGER,
    mov_id INTEGER,
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_genres (
    mov_id INTEGER,
    gen_id INTEGER,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE rating (
    mov_id INTEGER,
    rev_id INTEGER,
    rev_stars NUMERIC,
    num_o_ratings INTEGER,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);


