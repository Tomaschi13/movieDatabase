SELECT reviewer.rev_name, movie.mov_title
FROM rating
JOIN reviewer ON rating.rev_id = reviewer.rev_id
JOIN movie ON rating.mov_id = movie.mov_id
WHERE rating.rev_stars >= 7;
