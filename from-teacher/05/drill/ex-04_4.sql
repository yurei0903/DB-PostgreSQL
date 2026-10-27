SET
  search_path TO w03;

SELECT
  CASE
    WHEN GROUPING(job) = 1 THEN '-TOTAL-'
    ELSE job
  END AS "job",
  MAX(level) AS "max_lv",
  ROUND(AVG(level), 1) AS "avg_lv",
  COUNT(*) AS "num"
FROM
  characters
GROUP BY
  ROLLUP (job)
ORDER BY
  job;