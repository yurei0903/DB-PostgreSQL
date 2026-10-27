SET
  search_path TO w03;

SELECT
  id,
  job,
  level,
  name
FROM
  characters
ORDER BY
  job,
  level DESC,
  name;

-- 別解 ASC を明示

SELECT
  id,
  job,
  level,
  name
FROM
  characters
ORDER BY
  job ASC,
  level DESC,
  name ASC;
