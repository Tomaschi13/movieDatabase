CREATE TABLE movie_count_year AS
SELECT mov_year, COUNT(*) AS count_year
FROM movie
GROUP BY mov_year;

CREATE OR REPLACE FUNCTION update_movie_count_year()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM movie_count_year;

    INSERT INTO movie_count_year (mov_year, count_year)
    SELECT mov_year, COUNT(*) FROM movie GROUP BY mov_year;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER count_movies_year
AFTER INSERT OR UPDATE OR DELETE ON movie
EXECUTE FUNCTION update_movie_count_year();
