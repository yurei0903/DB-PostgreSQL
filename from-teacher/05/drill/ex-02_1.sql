SET
  search_path TO w03;

START TRANSACTION;

-- 更新前のレコードを確認
SELECT
  id,
  name,
  buff
FROM
  characters
ORDER BY
  id;

-- 更新処理
UPDATE characters
SET
  buff = 0.0;

-- 更新後のレコードを確認
SELECT
  id,
  name,
  buff
FROM
  characters
ORDER BY
  id;

ROLLBACK;