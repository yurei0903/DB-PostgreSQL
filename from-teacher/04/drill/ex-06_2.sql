SET
  search_path TO w03;

START TRANSACTION;

-- age の指定を省略し、name、id の順に2件を挿入
INSERT INTO
  users (name, id)
VALUES
  ('Ellen', 3),
  ('Frank', 4);

-- 挿入後の4件を確認（Ellen と Frank の age は NULL）
SELECT
  *
FROM
  users
ORDER BY
  id ASC;

ROLLBACK;

-- 挿入が取り消され、元の2件に戻ったことを確認
SELECT
  *
FROM
  users
ORDER BY
  id ASC;
