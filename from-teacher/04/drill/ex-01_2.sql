SET
  search_path TO w03;

SELECT
  id,
  guild,
  level AS "Lv.",
  name || ' (' || job || ')' AS "name (job)"
FROM
  characters
ORDER BY
  LOWER(guild) ASC,
  level DESC;