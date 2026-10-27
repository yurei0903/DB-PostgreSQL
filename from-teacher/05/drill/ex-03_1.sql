SET
  search_path TO w03;

SELECT
  COUNT(DISTINCT job) || '種類' AS "ジョブ種"
FROM
  characters;