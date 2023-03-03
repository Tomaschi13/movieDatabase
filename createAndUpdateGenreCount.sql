CREATE TABLE genre_movie_count AS
SELECT gen_title, COUNT(*) AS movie_count
FROM genres
JOIN movie_genres ON genres.gen_id = movie_genres.gen_id
GROUP BY gen_title;

CREATE OR REPLACE FUNCTION update_genre_movie_count()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM genre_movie_count WHERE TRUE;

    INSERT INTO genre_movie_count (gen_title, movie_count)
    SELECT gen_title, COUNT(*) FROM genres
    JOIN movie_genres ON genres.gen_id = movie_genres.gen_id
    GROUP BY gen_title;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER genre_movie_count_trigger
AFTER INSERT OR UPDATE OR DELETE ON movie_genres
EXECUTE FUNCTION update_genre_movie_count();
