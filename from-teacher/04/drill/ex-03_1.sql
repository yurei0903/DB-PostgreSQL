SET
  search_path TO w03;

SELECT
  id,
  name,
  level,
  COALESCE(guild, '(無所属)') AS "guild"
FROM
  characters
ORDER BY
  CASE
    WHEN guild = 'Yamato' THEN 1
    WHEN guild IS NULL THEN 2
    ELSE 3
  END,
  LOWER(guild),
  level DESC;
