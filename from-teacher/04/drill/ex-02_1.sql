SET
  search_path TO w03;

SELECT
  id,
  name,
  level,
  guild
FROM
  characters
ORDER BY
  LOWER(guild) ASC NULLS FIRST,
  level;