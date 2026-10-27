SET
  search_path TO w03;

SELECT
  id,
  name,
  level,
  created_on
FROM
  characters
WHERE
  name LIKE 'T%'
ORDER BY
  name;