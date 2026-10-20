-- 第03回の演習で使うテーブルの格納先として、スキーマ w03 を作成する
CREATE SCHEMA IF NOT EXISTS w03;

-- 以降のSQLで使用するスキーマを指定する
SET
    search_path TO w03;

-- 既に同名のテーブルがあれば削除する
DROP TABLE IF EXISTS users;

-- ユーザ情報を保持するテーブルを作成する
CREATE TABLE users (id INTEGER PRIMARY KEY, name VARCHAR(16) NOT NULL, age INTEGER);

-- テーブルにレコード（ユーザ情報）を挿入する
INSERT INTO
    users (id, name, age)
VALUES
    (1, 'Alice', 20),
    (2, 'Bob', 25);

-- すべてのレコードを抽出する
SELECT
    *
FROM
    users;