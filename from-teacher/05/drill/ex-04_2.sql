SET
  search_path TO w03;

SELECT
  job,
  COUNT(level) AS "num",
  ROUND(AVG(level), 1) AS "avg_lv"
FROM
  characters
GROUP BY
  job
ORDER BY
  AVG(level) DESC;
