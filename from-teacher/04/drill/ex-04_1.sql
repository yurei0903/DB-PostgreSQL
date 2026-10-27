SET
  search_path TO w03;

SELECT
  id,
  name,
  job,
  level
FROM
  characters
ORDER BY
  RANDOM()
LIMIT
  3;
