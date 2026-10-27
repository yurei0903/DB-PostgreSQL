SET
  search_path TO w03;

SELECT
  CASE
    WHEN job IN ('Priest', 'Wizard') THEN 'backline'
    ELSE 'frontline'
  END AS "battle_position",
  MAX(level) AS "max_lv",
  ROUND(AVG(level), 1) AS "avg_lv",
  COUNT(*) AS "num"
FROM
  characters
GROUP BY
  CASE
    WHEN job IN ('Priest', 'Wizard') THEN 'backline'
    ELSE 'frontline'
  END
ORDER BY
  "battle_position";