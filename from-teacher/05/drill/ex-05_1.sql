SET
  search_path TO w03;

SELECT
  job,
  ROUND(AVG(level), 1) AS "avg_lv",
  COUNT(*) AS "num"
FROM
  characters
GROUP BY
  job
HAVING
  COUNT(*) > 2
ORDER BY
  AVG(level) DESC;