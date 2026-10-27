SET
  search_path TO w03;

SELECT
  id,
  name,
  level,
  buff
FROM
  characters
WHERE
  buff <> 0.00
ORDER BY
  buff DESC,
  level DESC;