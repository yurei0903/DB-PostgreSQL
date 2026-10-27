SET
  search_path TO w03;

SELECT
  id,
  name,
  level,
  created_on
FROM
  characters
WHERE
  created_on NOT BETWEEN '2021-01-01' AND '2022-12-31'
ORDER BY
  created_on ASC,
  id ASC;

-- 様々な別解が存在します。