SET
  search_path TO w03;

START TRANSACTION;

-- レコードの挿入
INSERT INTO
  characters (name, job, level, buff, guild, created_on, last_login_at)
VALUES
  ('Zoe', 'Paladin', 11, 0.0, 'W.Wind', '2025-10-12', '2025-10-20 15:48:00'),
  ('Justin', 'Archer', 2, 0.5, NULL, '2025-10-23', '2025-10-23 11:28:00');

-- 確認
SELECT
  *
FROM
  characters
ORDER BY
  created_on DESC;

ROLLBACK;