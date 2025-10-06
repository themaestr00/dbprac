-- 4. Удаление аккаунтов студентов, отчисленных более года назад

DELETE FROM account acc_t
USING student s
JOIN educational_status es ON es.id = s.status_id
WHERE acc_t.id = s.account_id
AND es.status = 'expelled'
AND es.valid_to < CURRENT_DATE - INTERVAL '1 year'
