BEGIN ISOLATION LEVEL READ UNCOMMITTED;
UPDATE stipend
SET amount = amount * 1.1
WHERE type = 2;
UPDATE stipend
SET amount = amount * 1.1
WHERE type = 3;
COMMIT;
