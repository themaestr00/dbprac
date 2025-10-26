SET synchronous_commit = off;
SET maintenance_work_mem = '2GB';
SET work_mem = '256MB';
SET temp_buffers = '512MB';

INSERT INTO analytics.dim_faculty(name)
SELECT 'Faculty ' || gs::text
FROM generate_series(1, 1000000) AS gs;

WITH b AS (
  SELECT (SELECT min(id) FROM analytics.dim_faculty) AS fmin,
         (SELECT max(id) FROM analytics.dim_faculty) AS fmax
)
INSERT INTO analytics.dim_cathedra(name, faculty_id)
SELECT 'Cathedra ' || gs::text,
       b.fmin + (random()*(b.fmax-b.fmin))::int
FROM generate_series(1, 1000000) gs, b;

INSERT INTO analytics.dim_student(first_name, last_name, group_number, student_info)
SELECT
  'Name_' || gs::text, 'Surname_' || gs::text,
  100 + (random()*900)::int,
  jsonb_build_object(
    'edu_type',  (ARRAY['full_time','part_time','distance'])[1 + (random()*2)::int],
    'birth_year', 1980 + (random()*25)::int,
    'email', 'student'||gs||'@u.example'
  )
FROM generate_series(1, 10000000) gs;

INSERT INTO analytics.dim_educator (first_name, last_name, educator_info)
SELECT
  'Edu_' || gs::text, 'Surname_' || gs::text,
  jsonb_build_object(
    'degree', (ARRAY['PhD','DrSci','MSc'])[1 + (random()*2)::int],
    'academic_title', (ARRAY['Профессор','Доцент','Ассистент'])[1 + (random()*2)::int],
    'specialization', (ARRAY['AI','Databases','Networks','Security','Math'])[1 + (random()*4)::int],
    'research_tags', ARRAY[
        (ARRAY['AI','DB','ML','Cloud','IoT','Stats'])[1 + (random()*5)::int],
        (ARRAY['AI','DB','ML','Cloud','IoT','Stats'])[1 + (random()*5)::int]
    ]::text[]
	)
FROM generate_series(1, 1000000) gs;

WITH topics AS (
  SELECT ARRAY['db','ml','ai','sec','net','algo','math','viz','cloud']::text[] AS pool
)
INSERT INTO analytics.dim_article(title, publish_date, topics)
SELECT
  'Article #' || gs::text,
  DATE '2005-01-01' + (random()* (365*20))::int,
  (SELECT ARRAY(
      SELECT DISTINCT pool[1 + (random()* (array_length(pool,1)-1))::int]
      FROM generate_series(1, 1 + (random()*2)::int)
    ) FROM topics)
FROM generate_series(1, 1000000) gs;

INSERT INTO analytics.dim_term(year, term_no)
SELECT y, t
FROM generate_series(2000, EXTRACT(YEAR FROM CURRENT_DATE)::int) AS y
CROSS JOIN generate_series(1,12) AS t;

INSERT INTO analytics.dim_date(date, quarter, is_holiday)
SELECT d::date, EXTRACT(QUARTER FROM d)::int,
       false
FROM generate_series('2000-01-01'::date, CURRENT_DATE, interval '1 day') AS d;

DO $$
DECLARE
  batch_size bigint := 5000000;
  batches int := 20;
  i int;
  dmin int; dmax int;
  emin int; emax int;
  cmin int; cmax int;
  amin int; amax int;
BEGIN
  SELECT min(id), max(id) INTO dmin, dmax FROM analytics.dim_date;
  SELECT min(id), max(id) INTO emin, emax FROM analytics.dim_educator;
  SELECT min(id), max(id) INTO cmin, cmax FROM analytics.dim_cathedra;
  SELECT min(id), max(id) INTO amin, amax FROM analytics.dim_article;
  FOR i IN 1..batches LOOP
    INSERT INTO analytics.fact_daily_educator_activity
      (date_id, educator_id, cathedra_id, article_id, conducted, published)
    SELECT
      dmin + (random()*(dmax-dmin))::int,
      emin + (random()*(emax-emin))::int,
      cmin + (random()*(cmax-cmin))::int,
      amin + (random()*(amax-amin))::int,
      (random()*6)::int,
      true
    FROM generate_series(1, batch_size)
	CROSS JOIN b;

    RAISE NOTICE 'Batch % of %, inserted % rows', i, batches, batch_size;
  END LOOP;
END $$;

DO $$
DECLARE
  batch_size bigint := 1000000;
  batches int := 10;
  i int;
  fmin int; fmax int;
BEGIN
  SELECT min(id), max(id) INTO fmin, fmax FROM analytics.dim_faculty;
  FOR i IN 1..batches LOOP
    INSERT INTO analytics.fact_score
      (student_id, faculty_id, term_id, avg_score_value)
    SELECT
      gs,
	  fmin + (random()*(fmax-fmin))::int,
	  t,
	  2 + (3 * random())::int
    FROM generate_series(1 + batch_size * (i - 1), batch_size * i) gs
	CROSS JOIN generate_series(1, 1 + 27 * 11, 27) AS t;

    RAISE NOTICE 'Batch % of %, inserted % rows', i, batches, batch_size * 12;
  END LOOP;
END $$;

ANALYZE
