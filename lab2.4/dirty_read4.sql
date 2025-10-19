BEGIN ISOLATION LEVEL READ COMMITTED;
SELECT publishing, COUNT(*) AS published
FROM article
WHERE publish_date > '2022-01-01'
GROUP BY publishing
ORDER BY published;
COMMIT;
