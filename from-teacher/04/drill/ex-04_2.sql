SET
  search_path TO w03;

SELECT
  id,
  name,
  last_login_at
FROM
  characters
ORDER BY
  last_login_at NULLS FIRST
LIMIT
  5;
