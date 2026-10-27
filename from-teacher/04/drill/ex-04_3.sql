SET
  search_path TO w03;

SELECT
  id,
  name,
  created_on
FROM
  characters
ORDER BY
  created_on
OFFSET
  10
LIMIT
  5;