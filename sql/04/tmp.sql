SET
    search_path TO w03;

SELECT
    *
FROM
    characters
WHERE
    job NOT IN ('Priest', 'Wizard');