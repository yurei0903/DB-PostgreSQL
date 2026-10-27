SET
  search_path TO w03;

START TRANSACTION;

-- 更新前のレコードを確認
SELECT
  id,
  name,
  job,
  guild,
  buff,
  CASE
    WHEN guild IS NULL AND
    job IN ('Fighter', 'Monk', 'Samurai', 'Ninja') THEN 'Yes'
    ELSE 'No'
  END AS "is_target"
FROM
  characters
ORDER BY
  id;

-- 更新処理
UPDATE characters
SET
  buff = buff + 0.25
WHERE
  guild IS NULL AND
  job IN ('Fighter', 'Monk', 'Samurai', 'Ninja');

SELECT
  id,
  name,
  job,
  guild,
  buff,
  CASE
    WHEN guild IS NULL AND
    job IN ('Fighter', 'Monk', 'Samurai', 'Ninja') THEN 'Yes'
    ELSE 'No'
  END AS "is_target"
FROM
  characters
ORDER BY
  id;

ROLLBACK;