SET
  search_path TO w03;

SELECT
  MAX(LENGTH(COALESCE(guild,'Freelancer'))) AS "最大文字数"
FROM
  characters;