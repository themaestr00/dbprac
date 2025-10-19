BEGIN ISOLATION LEVEL READ UNCOMMITTED;
UPDATE stipend
SET amount = amount * 1.2
WHERE type = 3;
UPDATE stipend
SET amount = amount * 1.2
WHERE type = 2;
COMMIT;
