BEGIN ISOLATION LEVEL READ COMMITTED;
UPDATE article
SET publishing = 'Химия Сегдня'
WHERE name = 'Химия Today';
ROLLBACK;
