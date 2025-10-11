-- 1. Переназначим преподавателя в расписании (1 - Егор Смирнов на 9 - Сергей Морозов) и удалим его из базы

UPDATE lesson SET educator_id = 9 WHERE educator_id = 1;
UPDATE individual_course SET educator_id = 9 WHERE educator_id = 1;
DELETE
FROM account acc_t
USING educator e
WHERE e.account_id = acc_t.id AND e.id = 1;
