SET
  search_path TO w03;

SELECT
  ROUND(AVG(level),2) AS "無所属平均Lv",
  SUM(level) AS "無所属合計Lv"
FROM
  characters
WHERE
  guild IS NULL;