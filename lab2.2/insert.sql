INSERT INTO account (login, password, first_name, last_name, birth_date, email, phone, status) 
VALUES
-- Educators
('e.smirnov', 'TeachPass1', 'Егор', 'Смирнов', '1975-03-14', 'e.smirnov@univ.example', '+7-900-100-0101', 'educator'),
('a.ivanova', 'TeachPass2', 'Алёна', 'Иванова', '1980-11-22', 'a.ivanova@univ.example', '+7-900-100-0102', 'educator'),
('p.petrov',  'TeachPass3', 'Павел', 'Петров', '1969-07-05', 'p.petrov@univ.example', '+7-900-100-0103', 'educator'),
('n.kuznetsov','TeachPass4', 'Наталья', 'Кузнецова', '1985-01-30', 'n.kuznetsov@univ.example','+7-900-100-0104', 'educator'),
('i.sokolov', 'TeachPass5', 'Игорь', 'Соколов', '1978-09-18', 'i.sokolov@univ.example', '+7-900-100-0105', 'educator'),
('m.popova', 'TeachPass6', 'Марина', 'Попова', '1972-12-11', 'm.popova@univ.example', '+7-900-100-0106', 'educator'),
('d.volkov', 'TeachPass7', 'Дмитрий', 'Волков', '1983-04-07', 'd.volkov@univ.example', '+7-900-100-0107', 'educator'),
('o.lebedeva', 'TeachPass8', 'Ольга', 'Лебедева', '1976-06-26', 'o.lebedeva@univ.example', '+7-900-100-0108', 'educator'),
('s.morozov', 'TeachPass9', 'Сергей', 'Морозов', '1981-02-03', 's.morozov@univ.example', '+7-900-100-0109', 'educator'),
('t.belova', 'TeachPass10', 'Татьяна', 'Белова', '1974-10-15', 't.belova@univ.example', '+7-900-100-0110', 'educator'),

-- Students
('st.ivanov1', 'StudPass1', 'Алексей', 'Иванов', '2005-03-21', 'st.ivanov1@univ.example', '+7-901-200-0201', 'student'),
('st.petrov1', 'StudPass2', 'Пётр', 'Петров', '2004-11-09', 'st.petrov1@univ.example', '+7-901-200-0202', 'student'),
('st.sidorov', 'StudPass3', 'Илья', 'Сидоров', '2005-07-12', 'st.sidorov@univ.example', '+7-901-200-0203', 'student'),
('st.kim1', 'StudPass4', 'Даниил', 'Ким', '2006-01-05', 'st.kim1@univ.example', '+7-901-200-0204', 'student'),
('st.orlova', 'StudPass5', 'Евгения', 'Орлова', '2005-05-27', 'st.orlova@univ.example', '+7-901-200-0205', 'student'),
('st.egorov', 'StudPass6', 'Егор', 'Егоров', '2004-09-18', 'st.egorov@univ.example', '+7-901-200-0206', 'student'),
('st.fedorov', 'StudPass7',  'Фёдор', 'Фёдоров', '2005-12-02', 'st.fedorov@univ.example', '+7-901-200-0207', 'student'),
('st.smirnova','StudPass8',  'Анна', 'Смирнова', '2006-02-14', 'st.smirnova@univ.example', '+7-901-200-0208', 'student'),
('st.kuzmina', 'StudPass9',  'Мария', 'Кузьмина', '2005-04-11', 'st.kuzmina@univ.example', '+7-901-200-0209', 'student'),
('st.borisov', 'StudPass10', 'Борис', 'Борисов', '2004-08-29', 'st.borisov@univ.example', '+7-901-200-0210', 'student');


INSERT INTO educator (account_id, degree)
SELECT id, 'канд. физ.-мат. наук'
FROM account WHERE login = 'e.smirnov';

INSERT INTO educator (account_id, degree)
SELECT id, 'доктор филол. наук'
FROM account WHERE login = 'a.ivanova';

INSERT INTO educator (account_id, degree)
SELECT id, 'канд. техн. наук'
FROM account WHERE login = 'p.petrov';

INSERT INTO educator (account_id, degree)
SELECT id, 'канд. пед. наук'
FROM account WHERE login = 'n.kuznetsov';

INSERT INTO educator (account_id, degree)
SELECT id, 'доктор техн. наук'
FROM account WHERE login = 'i.sokolov';

INSERT INTO educator (account_id, degree)
SELECT id, 'канд. эконом. наук'
FROM account WHERE login = 'm.popova';

INSERT INTO educator (account_id, degree)
SELECT id, 'канд. ист. наук'
FROM account WHERE login = 'd.volkov';

INSERT INTO educator (account_id, degree)
SELECT id, 'канд. биол. наук'
FROM account WHERE login = 'o.lebedeva';

INSERT INTO educator (account_id, degree)
SELECT id, 'доктор физ.-мат. наук'
FROM account WHERE login = 's.morozov';

INSERT INTO educator (account_id, degree)
SELECT id, 'канд. хим. наук'
FROM account WHERE login = 't.belova';


INSERT INTO faculty (name, dean) VALUES
('Факультет ВМК', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='i.sokolov')),
('Географический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='e.smirnov')),
('Филологический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='a.ivanova')),
('Механико-математический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='p.petrov')),
('Факультет журналистики', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='n.kuznetsov'));
('Экономический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='m.popova')),
('Исторический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='d.volkov')),
('Биологический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='o.lebedeva')),
('Физический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='s.morozov')),
('Химический факультет', (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='t.belova')),


INSERT INTO speciality (speciality_code, name, quota, faculty_id) VALUES
('01.03.02', 'Прикладная математика и информатика', 120, (SELECT id FROM faculty WHERE name='Факультет ВМК')),
('05.03.02', 'География', 70, (SELECT id FROM faculty WHERE name='Географический факультет')),
('45.03.01', 'Филология', 85, (SELECT id FROM faculty WHERE name='Филологический факультет')),
('02.03.01', 'Математика и компьютерные науки', 110, (SELECT id FROM faculty WHERE name='Механико-математический факультет')),
('42.03.02', 'Журналистика', 130, (SELECT id FROM faculty WHERE name='Факультет журналистики'));
('38.03.01', 'Экономика', 160, (SELECT id FROM faculty WHERE name='Экономический факультет')),
('46.03.01', 'История', 80, (SELECT id FROM faculty WHERE name='Исторический факультет')),
('06.03.01', 'Биология', 90, (SELECT id FROM faculty WHERE name='Биологический факультет')),
('03.03.02', 'Физика', 150, (SELECT id FROM faculty WHERE name='Физический факультет')),
('04.03.01', 'Химия', 100, (SELECT id FROM faculty WHERE name='Химический факультет')),


INSERT INTO education (speciality_code, basis, type) VALUES
('01.03.02', 'budget', 'full_time'),
('03.03.02', 'budget', 'full_time'),
('02.03.01', 'budget', 'full_time'),
('04.03.01', 'budget', 'full_time'),
('06.03.01', 'budget', 'full_time'),
('38.03.01', 'budget', 'full_time'),
('46.03.01', 'budget', 'full_time'),
('45.03.01', 'budget', 'full_time'),
('05.03.02', 'budget', 'full_time'),
('42.03.02', 'contract','part_time');


INSERT INTO building (address, name) VALUES
('Москва, Ленинские горы, д.1', 'Главный корпус МГУ'),
('Москва, Ленинские горы, д.1 стр.2', 'Шуваловский корпус'),
('Москва, Ленинские горы, д.1 стр.3', 'Корпус физического факультета'),
('Москва, Ленинские горы, д.1 стр.4', 'Корпус химического факультета'),
('Москва, Ленинские горы, д.1 стр.5', 'Корпус биологического факультета'),
('Москва, Ленинские горы, д.1 стр.6', 'Корпус факультета ВМК'),
('Москва, Ленинские горы, д.1 стр.7', 'Корпус экономического факультета'),
('Москва, Ленинские горы, д.1 стр.8', 'Корпус историко-филологического комплекса');


INSERT INTO room (name, building_id, capacity) VALUES
('ГЗ-01', (SELECT id FROM building WHERE name='Главный корпус МГУ'), 120),
('ГЗ-02', (SELECT id FROM building WHERE name='Главный корпус МГУ'), 90),

('Ш-101', (SELECT id FROM building WHERE name='Шуваловский корпус'), 150),

('СФА', (SELECT id FROM building WHERE name='Корпус физического факультета'), 110),
('ЮФА', (SELECT id FROM building WHERE name='Корпус физического факультета'), 200),

('101', (SELECT id FROM building WHERE name='Корпус химического факультета'), 90),

('532', (SELECT id FROM building WHERE name='Корпус биологического факультета'), 80),

('П-6', (SELECT id FROM building WHERE name='Корпус факультета ВМК'), 100),
('528', (SELECT id FROM building WHERE name='Корпус факультета ВМК'), 30),

('333', (SELECT id FROM building WHERE name='Корпус экономического факультета'), 90),

('222', (SELECT id FROM building WHERE name='Корпус историко-филологического комплекса'), 85);


INSERT INTO discipline (name, speciality_code, load) VALUES
('Линейная алгебра', '02.03.01', 144),
('Алгоритмы и структуры данных', '01.03.02', 144),
('Общая физика: механика', '03.03.02', 108),
('Органическая химия', '04.03.01', 126),
('Микробиология', '06.03.01', 120),
('Экономическая теория', '38.03.01', 144),
('Всеобщая история (новое время)', '46.03.01', 90),
('Введение в филологию', '45.03.01', 72),
('Физическая география материков', '05.03.02', 108),
('Основы журналистики', '42.03.02', 96);


INSERT INTO lesson (day, scheduled_start, scheduled_end, discipline_id, educator_id, room_id, parity) VALUES
-- Понедельник
('monday', '08:45',  '10:20',
  (SELECT id FROM discipline WHERE name='Алгоритмы и структуры данных'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='i.sokolov'),
  (SELECT r.id FROM room r WHERE r.name='П-6'),
  'all'),

('monday', '10:30', '12:05',
  (SELECT id FROM discipline WHERE name='Линейная алгебра'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='p.petrov'),
  (SELECT r.id FROM room r WHERE r.name='528'),
  'all'),

-- Вторник
('tuesday', '08:45', '10:20',
  (SELECT id FROM discipline WHERE name='Общая физика: механика'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='s.morozov'),
  (SELECT r.id FROM room r WHERE r.name='СФА'),
  'all'),

('tuesday', '10:30', '12:05',
  (SELECT id FROM discipline WHERE name='Органическая химия'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='t.belova'),
  (SELECT r.id FROM room r WHERE r.name='101'),
  'all'),

-- Среда
('wednesday', '08:45', '10:20',
  (SELECT id FROM discipline WHERE name='Микробиология'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='o.lebedeva'),
  (SELECT r.id FROM room r WHERE r.name='532'),
  'all'),

('wednesday', '10:30', '12:05',
  (SELECT id FROM discipline WHERE name='Введение в филологию'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='a.ivanova'),
  (SELECT r.id FROM room r WHERE r.name='222'),
  'all'),

-- Четверг
('thursday', '12:50', '14:25',
  (SELECT id FROM discipline WHERE name='Экономическая теория'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='m.popova'),
  (SELECT r.id FROM room r WHERE r.name='333'),
  'all'),

('thursday', '14:35', '16:10',
  (SELECT id FROM discipline WHERE name='Физическая география материков'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='e.smirnov'),
  (SELECT r.id FROM room r WHERE r.name='ГЗ-01'),
  'all'),

-- Пятница
('friday', '08:45', '10:20',
  (SELECT id FROM discipline WHERE name='Всеобщая история (новое время)'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='d.volkov'),
  (SELECT r.id FROM room r WHERE r.name='ГЗ-02'),
  'all'),

('friday', '10:30', '12:05',
  (SELECT id FROM discipline WHERE name='Основы журналистики'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='n.kuznetsov'),
  (SELECT r.id FROM room r WHERE r.name='Ш-101'),
  'all');


INSERT INTO academic_group (speciality_code, group_number) VALUES
('01.03.02', 101), -- Прикладная математика и информатика
('03.03.02', 102), -- Физика
('02.03.01', 103), -- Математика и комп. науки
('04.03.01', 104), -- Химия
('06.03.01', 105), -- Биология
('38.03.01', 106), -- Экономика
('46.03.01', 107), -- История
('45.03.01', 108), -- Филология
('05.03.02', 109), -- География
('42.03.02', 110); -- Журналистика


-- 1 Алгоритмы и структуры данных: группы 101 (Прикладн. мат. и информ.) и 103 (Математика и КН)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 101
WHERE d.name = 'Алгоритмы и структуры данных' AND l.day='monday' AND l.scheduled_start='08:45';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 103
WHERE d.name = 'Алгоритмы и структуры данных' AND l.day='monday' AND l.scheduled_start='08:45';

-- 2 Линейная алгебра: группы 103 и 101
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 103
WHERE d.name = 'Линейная алгебра' AND l.day='monday' AND l.scheduled_start='10:30';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 101
WHERE d.name = 'Линейная алгебра' AND l.day='monday' AND l.scheduled_start='10:30';

-- 3 Общая физика: механика: группы 102 (Физика) и 103 (Мат/КН)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 102
WHERE d.name = 'Общая физика: механика' AND l.day='tuesday' AND l.scheduled_start='08:45';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 103
WHERE d.name = 'Общая физика: механика' AND l.day='tuesday' AND l.scheduled_start='08:45';

-- 4 Органическая химия: группы 104 (Химия) и 105 (Биология)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 104
WHERE d.name = 'Органическая химия' AND l.day='tuesday' AND l.scheduled_start='10:30';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 105
WHERE d.name = 'Органическая химия' AND l.day='tuesday' AND l.scheduled_start='10:30';

-- 5 Микробиология: группы 105 (Биология) и 104 (Химия)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 105
WHERE d.name = 'Микробиология' AND l.day='wednesday' AND l.scheduled_start='08:45';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 104
WHERE d.name = 'Микробиология' AND l.day='wednesday' AND l.scheduled_start='08:45';

-- 6 Введение в филологию: группы 108 (Филология) и 107 (История)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 108
WHERE d.name = 'Введение в филологию' AND l.day='wednesday' AND l.scheduled_start='10:30';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 107
WHERE d.name = 'Введение в филологию' AND l.day='wednesday' AND l.scheduled_start='10:30';

-- 7 Экономическая теория: группы 106 (Экономика) и 110 (Журналистика)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 106
WHERE d.name = 'Экономическая теория' AND l.day='thursday' AND l.scheduled_start='12:50';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 110
WHERE d.name = 'Экономическая теория' AND l.day='thursday' AND l.scheduled_start='12:50-';

-- 8 Физическая география материков: группы 109 (География) и 105 (Биология)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 109
WHERE d.name = 'Физическая география материков' AND l.day='thursday' AND l.scheduled_start='14:35';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 105
WHERE d.name = 'Физическая география материков' AND l.day='thursday' AND l.scheduled_start='14:35';

-- 9 Всеобщая история (новое время): группы 107 (История) и 110 (Журналистика)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 107
WHERE d.name = 'Всеобщая история (новое время)' AND l.day='friday' AND l.scheduled_start='08:45';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 110
WHERE d.name = 'Всеобщая история (новое время)' AND l.day='friday' AND l.scheduled_start='08:45';

-- 10 Основы журналистики: группы 110 (Журналистика) и 108 (Филология)
INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 110
WHERE d.name = 'Основы журналистики' AND l.day='friday' AND l.scheduled_start='10:30';

INSERT INTO lesson_group (lesson_id, group_id)
SELECT l.id, g.id
FROM lesson l
JOIN discipline d ON d.id = l.discipline_id
JOIN academic_group g ON g.group_number = 108
WHERE d.name = 'Основы журналистики' AND l.day='friday' AND l.scheduled_start='10:30';


INSERT INTO educational_status (term, valid_from, valid_to, status) VALUES
(1, '2024-09-01', '2025-01-31', 'active'),
(2, '2025-02-01', '2025-06-30', 'active'),
(3, '2025-09-01', '2026-01-31', 'academic_leave'),
(4, '2026-02-01', '2026-06-30', 'active'),
(5, '2026-09-01', '2027-01-31', 'active'),
(6, '2027-02-01', '2027-06-30', 'active'),
(7, '2027-09-01', '2028-01-31', 'active'),
(8, '2028-02-01', '2028-06-30', 'active'),
(9, '2028-09-01', '2029-01-31', 'active'),
(10,'2029-02-01', NULL, 'graduated');


INSERT INTO stipend (amount) VALUES
(0.00), -- отсутствие
(3500.00), -- за 4
(5000.00), -- за 4 и 5
(7000.00); -- за 5


INSERT INTO student (account_id, acception_date, group_id, education_id, stipend_type, status_id) VALUES
-- 1 Прикладная математика и информатика (группа 101), активен, без стипендии
(
  (SELECT id FROM account WHERE login='st.ivanov1'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=101),
  (SELECT id FROM education WHERE speciality_code='01.03.02'),
  1,
  1
),
-- 2 Физика (группа 102), активен, стипендия за 4
(
  (SELECT id FROM account WHERE login='st.petrov1'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=102),
  (SELECT id FROM education WHERE speciality_code='03.03.02'),
  2,
  1
),
-- 3 Математика и КН (группа 103), активен, стипендия за 4 и 5
(
  (SELECT id FROM account WHERE login='st.sidorov'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=103),
  (SELECT id FROM education WHERE speciality_code='02.03.01'),
  3,
  1
),
-- 4 География (группа 109), активен, стипендия за 5
(
  (SELECT id FROM account WHERE login='st.kim1'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=109),
  (SELECT id FROM education WHERE speciality_code='05.03.02'),
  4,
  1
),
-- 5 Экономика (группа 106), активен, стипендия за 4
(
  (SELECT id FROM account WHERE login='st.orlova'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=106),
  (SELECT id FROM education WHERE speciality_code='38.03.01'),
  2,
  1
),
-- 6 Биология (группа 105), активен, стипендия за 4 и 5
(
  (SELECT id FROM account WHERE login='st.egorov'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=105),
  (SELECT id FROM education WHERE speciality_code='06.03.01'),
  3,
  1
),
-- 7 История (группа 107), активен, без стипендии
(
  (SELECT id FROM account WHERE login='st.fedorov'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=107),
  (SELECT id FROM education WHERE speciality_code='46.03.01'),
  1,
  1
),
-- 8 Филология (группа 108), активен, стипендия за 5
(
  (SELECT id FROM account WHERE login='st.smirnova'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=108),
  (SELECT id FROM education WHERE speciality_code='45.03.01'),
  4,
  1
),
-- 9 Журналистика (группа 110), активен, стипендия за 4
(
  (SELECT id FROM account WHERE login='st.kuzmina'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=110),
  (SELECT id FROM education WHERE speciality_code='42.03.02'),
  2,
  1
),
-- 10 Химия (группа 104), активен, стипендия за 4 и 5
(
  (SELECT id FROM account WHERE login='st.borisov'),
  '2024-09-01',
  (SELECT id FROM academic_group WHERE group_number=104),
  (SELECT id FROM education WHERE speciality_code='04.03.01'),
  3,
  1
);


INSERT INTO individual_course (name, type, educator_id, load, room_id) VALUES
('Анализ данных в Python', 'inter-faculty course',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='i.sokolov'),
  72, (SELECT r.id FROM room r WHERE r.name='528')),
('Научное письмо', 'special seminar',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='a.ivanova'),
  36, (SELECT r.id FROM room r WHERE r.name='222')),
('Предпринимательство в науке', 'elective',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='m.popova'),
  48, (SELECT r.id FROM room r WHERE r.name='333')),
('Современные проблемы физики', 'special course',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='s.morozov'),
  54, (SELECT r.id FROM room r WHERE r.name='ЮФА')),
('Молекулярная биология', 'special course',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='o.lebedeva'),
  60, (SELECT r.id FROM room r WHERE r.name='532')),
('Геоинформационные системы', 'inter-faculty course',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='e.smirnov'),
  72, (SELECT r.id FROM room r WHERE r.name='ГЗ-02')),
('Финансовая аналитика', 'special course',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='m.popova'),
  72, (SELECT r.id FROM room r WHERE r.name='333')),
('История мировой культуры', 'inter-faculty course',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='d.volkov'),
  48, (SELECT r.id FROM room r WHERE r.name='ГЗ-01')),
('Практическая журналистика', 'special seminar',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='n.kuznetsov'),
  36, (SELECT r.id FROM room r WHERE r.name='Ш-101')),
('Органическая спектроскопия', 'elective',
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='t.belova'),
  54, (SELECT r.id FROM room r WHERE r.name='101'));


INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.ivanov1'),
 (SELECT id FROM individual_course WHERE name='Анализ данных в Python'), 1, 5),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.ivanov1'),
 (SELECT id FROM individual_course WHERE name='Научное письмо'), 1, 4);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.petrov1'),
 (SELECT id FROM individual_course WHERE name='Анализ данных в Python'), 1, 4),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.petrov1'),
 (SELECT id FROM individual_course WHERE name='Предпринимательство в науке'), 1, 5);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.sidorov'),
 (SELECT id FROM individual_course WHERE name='Современные проблемы физики'), 1, 5),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.sidorov'),
 (SELECT id FROM individual_course WHERE name='Геоинформационные системы'), 2, 5);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.kim1'),
 (SELECT id FROM individual_course WHERE name='Геоинформационные системы'), 1, 4),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.kim1'),
 (SELECT id FROM individual_course WHERE name='Органическая спектроскопия'), 2, 5);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.orlova'),
 (SELECT id FROM individual_course WHERE name='Молекулярная биология'), 1, 5),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.orlova'),
 (SELECT id FROM individual_course WHERE name='Финансовая аналитика'), 2, 4);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.egorov'),
 (SELECT id FROM individual_course WHERE name='Молекулярная биология'), 1, 5),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.egorov'),
 (SELECT id FROM individual_course WHERE name='Анализ данных в Python'), 2, 5);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.fedorov'),
 (SELECT id FROM individual_course WHERE name='История мировой культуры'), 1, 4),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.fedorov'),
 (SELECT id FROM individual_course WHERE name='Научное письмо'), 2, 5);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.smirnova'),
 (SELECT id FROM individual_course WHERE name='Научное письмо'), 1, 5),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.smirnova'),
 (SELECT id FROM individual_course WHERE name='Практическая журналистика'), 2, 5);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.kuzmina'),
 (SELECT id FROM individual_course WHERE name='Практическая журналистика'), 1, 4),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.kuzmina'),
 (SELECT id FROM individual_course WHERE name='Предпринимательство в науке'), 2, 4);

INSERT INTO course_registration (student_id, course_id, term, score_value) VALUES
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.borisov'),
 (SELECT id FROM individual_course WHERE name='Органическая спектроскопия'), 1, 5),
((SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.borisov'),
 (SELECT id FROM individual_course WHERE name='Современные проблемы физики'), 2, 4);


INSERT INTO score (discipline_id, educator_id, student_id, score_value, term) VALUES
(
  (SELECT id FROM discipline WHERE name='Алгоритмы и структуры данных'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='i.sokolov'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.sidorov'),
  5, 1
),
(
  (SELECT id FROM discipline WHERE name='Линейная алгебра'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='p.petrov'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.ivanov1'),
  4, 1
),
(
  (SELECT id FROM discipline WHERE name='Общая физика: механика'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='s.morozov'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.petrov1'),
  5, 1
),
(
  (SELECT id FROM discipline WHERE name='Органическая химия'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='t.belova'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.borisov'),
  4, 1
),
(
  (SELECT id FROM discipline WHERE name='Микробиология'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='o.lebedeva'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.egorov'),
  5, 1
),
(
  (SELECT id FROM discipline WHERE name='Экономическая теория'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='m.popova'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.orlova'),
  5, 1
),
(
  (SELECT id FROM discipline WHERE name='Всеобщая история (новое время)'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='d.volkov'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.fedorov'),
  4, 1
),
(
  (SELECT id FROM discipline WHERE name='Введение в филологию'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='a.ivanova'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.smirnova'),
  5, 1
),
(
  (SELECT id FROM discipline WHERE name='Физическая география материков'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='e.smirnov'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.kim1'),
  4, 1
),
(
  (SELECT id FROM discipline WHERE name='Основы журналистики'),
  (SELECT e.id FROM educator e JOIN account a ON a.id=e.account_id WHERE a.login='n.kuznetsov'),
  (SELECT s.id FROM student s JOIN account a ON a.id=s.account_id WHERE a.login='st.kuzmina'),
  5, 1
);


INSERT INTO article (name, publish_date, publishing) VALUES
('Математические модели турбулентности', '2021-03-15', 'Издательство МГУ'),
('Современные подходы к органической синтезу', '2022-05-10', 'Химия Today'),
('Инновации в преподавании филологии', '2023-01-22', 'Вестник Филологии'),
('Эконометрический анализ региональных рынков', '2022-11-05', 'Экономический журнал'),
('История культурных трансферов в Европе', '2021-09-18', 'Clio Press'),
('Алгоритмические оптимизации в обработке данных', '2023-04-03', 'Computer Science Review'),
('Биоинформатический анализ микробиомов', '2023-06-27', 'Journal of Bioinformatics'),
('Спектроскопические методы в органической химии','2022-12-14', 'Химический сборник'),
('Геоинформационные системы в экологии', '2021-07-09', 'GeoScience Reports'),
('Методология научного письма для студентов', '2024-02-01', 'Academic Skills Press');


-- 1. Математические модели турбулентности (s.morozov, p.petrov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Математические модели турбулентности'
WHERE a.login='s.morozov';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Математические модели турбулентности'
WHERE a.login='p.petrov';

-- 2. Современные подходы к органической синтезу (t.belova, o.lebedeva)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Современные подходы к органической синтезу'
WHERE a.login='t.belova';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Современные подходы к органической синтезу'
WHERE a.login='o.lebedeva';

-- 3. Инновации в преподавании филологии (a.ivanova, d.volkov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Инновации в преподавании филологии'
WHERE a.login='a.ivanova';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Инновации в преподавании филологии'
WHERE a.login='d.volkov';

-- 4. Эконометрический анализ региональных рынков (m.popova, e.smirnov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Эконометрический анализ региональных рынков'
WHERE a.login='m.popova';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Эконометрический анализ региональных рынков'
WHERE a.login='e.smirnov';

-- 5. История культурных трансферов в Европе (d.volkov, n.kuznetsov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='История культурных трансферов в Европе'
WHERE a.login='d.volkov';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='История культурных трансферов в Европе'
WHERE a.login='n.kuznetsov';

-- 6. Алгоритмические оптимизации в обработке данных (i.sokolov, p.petrov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Алгоритмические оптимизации в обработке данных'
WHERE a.login='i.sokolov';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Алгоритмические оптимизации в обработке данных'
WHERE a.login='p.petrov';

-- 7. Биоинформатический анализ микробиомов (o.lebedeva, t.belova)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Биоинформатический анализ микробиомов'
WHERE a.login='o.lebedeva';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Биоинформатический анализ микробиомов'
WHERE a.login='t.belova';

-- 8. Спектроскопические методы в органической химии (t.belova, s.morozov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Спектроскопические методы в органической химии'
WHERE a.login='t.belova';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Спектроскопические методы в органической химии'
WHERE a.login='s.morozov';

-- 9. Геоинформационные системы в экологии (e.smirnov, o.lebedeva)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Геоинформационные системы в экологии'
WHERE a.login='e.smirnov';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Геоинформационные системы в экологии'
WHERE a.login='o.lebedeva';

-- 10. Методология научного письма для студентов (a.ivanova, n.kuznetsov)
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Методология научного письма для студентов'
WHERE a.login='a.ivanova';
INSERT INTO author (educator_id, article_id)
SELECT e.id, ar.id FROM educator e
JOIN account a ON a.id=e.account_id
JOIN article ar ON ar.name='Методология научного письма для студентов'
WHERE a.login='n.kuznetsov';
