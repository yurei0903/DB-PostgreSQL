SET
  search_path TO w03;

SELECT
  MIN(buff) AS "min_buff",
  MAX(buff) AS "max_buff",
  MAX(buff) - MIN(buff) AS "max-min"
FROM
  characters;