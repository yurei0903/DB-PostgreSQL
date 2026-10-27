SET
  search_path TO w03;

SELECT
  job,
  guild,
  COUNT(*),
  ROUND(AVG(level),1) AS "avg_lv"
FROM
  characters
WHERE
  job IN ('Priest','Wizard')
GROUP BY
  job,
  guild
ORDER BY
  job,
  guild;
