CREATE TABLE movie_actor_count AS
SELECT mov_id, COUNT(*) AS actor_count
FROM movie_cast
GROUP BY mov_id;

CREATE OR REPLACE FUNCTION update_movie_actor_count()
RETURNS TRIGGER AS $$
BEGIN
    -- Delete the old counts for each movie
    DELETE FROM movie_actor_count WHERE TRUE;

    -- Insert the new counts for each movie
    INSERT INTO movie_actor_count (mov_id, actor_count)
    SELECT mov_id, COUNT(*) FROM movie_cast GROUP BY mov_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER movie_actor_count_trigger
AFTER INSERT OR UPDATE OR DELETE ON movie_cast
EXECUTE FUNCTION update_movie_actor_count();


