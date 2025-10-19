BEGIN ISOLATION LEVEL REPEATABLE READ;
INSERT INTO article(name, publish_date, publishing) VALUES
('Статический анализ бинарного кода', CURRENT_DATE, 'ИА Панорама');
INSERT INTO author(article_id, educator_id) VALUES
(11, 9);
COMMIT;
