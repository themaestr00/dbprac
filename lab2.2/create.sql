CREATE FUNCTION time_subtype_diff(x time, y time) RETURNS float8 AS
'SELECT EXTRACT(EPOCH FROM (x - y))' LANGUAGE sql STRICT IMMUTABLE;

CREATE TYPE timerange AS RANGE (
    subtype = time,
    subtype_diff = time_subtype_diff
);

CREATE EXTENSION btree_gist;

CREATE TYPE account_role AS ENUM ('student','educator');
CREATE TYPE education_basis AS ENUM ('budget','contract');
CREATE TYPE week_parity AS ENUM ('all','even','odd');
CREATE TYPE education_type AS ENUM ('full_time','part_time','distance');
CREATE TYPE weekday AS ENUM ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday');
CREATE TYPE edu_status AS ENUM ('active', 'expelled', 'academic_leave', 'graduated');
CREATE TYPE individual_course_type AS ENUM ('inter-faculty course', 'special course', 'special seminar', 'elective');

CREATE TABLE account (
	id SERIAL PRIMARY KEY,
	login VARCHAR(64) UNIQUE NOT NULL,
	password VARCHAR(64) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	birth_date DATE NOT NULL,
	email VARCHAR(254) CHECK (email ~ '^\S+@\S+\.\S+$'),
	phone VARCHAR(32),
	status account_role NOT NULL
);

CREATE TABLE educator (
	id SERIAL PRIMARY KEY,
	account_id INT UNIQUE NOT NULL REFERENCES account(id) ON DELETE CASCADE,
	degree TEXT NOT NULL
);

CREATE TABLE faculty (
	id SERIAL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL CHECK (name != ''),
	dean INT UNIQUE REFERENCES educator(id) ON DELETE SET NULL
);

CREATE TABLE speciality (
	speciality_code VARCHAR(32) PRIMARY KEY,
	name TEXT UNIQUE NOT NULL CHECK (name != ''),
	quota INT NOT NULL CHECK (quota >= 0),
	faculty_id INT NOT NULL REFERENCES faculty(id) ON DELETE RESTRICT
);

CREATE TABLE education (
	id SERIAL PRIMARY KEY,
	speciality_code VARCHAR(32) NOT NULL REFERENCES speciality(speciality_code) ON DELETE RESTRICT,
	basis education_basis NOT NULL,
	type education_type NOT NULL
);

CREATE TABLE discipline (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	speciality_code VARCHAR(32) NOT NULL REFERENCES speciality(speciality_code) ON DELETE RESTRICT,
	load INT NOT NULL CHECK (load > 0)
);

CREATE TABLE building (
	id SERIAL PRIMARY KEY,
	address TEXT NOT NULL,
	name TEXT NOT NULL
);

CREATE TABLE room (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	building_id INT NOT NULL REFERENCES building(id) ON DELETE CASCADE,
	capacity SMALLINT CHECK (capacity >= 0),

	CONSTRAINT room_building_unique UNIQUE (name, building_id)
);

CREATE TABLE lesson (
	id SERIAL PRIMARY KEY,
	day weekday NOT NULL,
	scheduled_start TIME NOT NULL,
	scheduled_end TIME NOT NULL,
	discipline_id INT NOT NULL REFERENCES discipline(id) ON DELETE RESTRICT,
	educator_id INT NOT NULL REFERENCES educator(id) ON DELETE RESTRICT,
	room_id INT NOT NULL REFERENCES room(id) ON DELETE RESTRICT,
	parity week_parity NOT NULL DEFAULT 'all',
	
	CHECK (scheduled_start < scheduled_end),
	EXCLUDE USING GIST (
		educator_id WITH =,
		day WITH =,
		parity WITH =,
		timerange(scheduled_start, scheduled_end) WITH &&
	),

	EXCLUDE USING GIST (
		room_id WITH =,
		day WITH =,
		parity WITH =,
		timerange(scheduled_start, scheduled_end) WITH &&
	)
);

CREATE TABLE academic_group (
	id SERIAL PRIMARY KEY,
	speciality_code VARCHAR(32) NOT NULL REFERENCES speciality(speciality_code) ON DELETE RESTRICT,
	group_number SMALLINT NOT NULL
);

CREATE TABLE lesson_group (
	lesson_id INT NOT NULL REFERENCES lesson(id) ON DELETE CASCADE,
	group_id INT NOT NULL REFERENCES academic_group(id) ON DELETE CASCADE,

	PRIMARY KEY (lesson_id, group_id)
);

CREATE TABLE educational_status (
	id SERIAL PRIMARY KEY,
	term SMALLINT NOT NULL CHECK (term BETWEEN 1 AND 12),
	valid_from DATE NOT NULL,
	valid_to DATE,
	status edu_status NOT NULL

	CHECK (valid_to IS NULL OR valid_from < valid_to)
);

CREATE TABLE stipend (
	type SERIAL PRIMARY KEY,
	amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0)
);

CREATE TABLE student (
	id SERIAL PRIMARY KEY,
	account_id INT UNIQUE NOT NULL REFERENCES account(id) ON DELETE CASCADE,
	acception_date DATE NOT NULL,
	group_id INT NOT NULL REFERENCES academic_group(id) ON DELETE RESTRICT,
	education_id INT NOT NULL REFERENCES education(id) ON DELETE RESTRICT,
	stipend_type INT NOT NULL REFERENCES stipend(type) ON DELETE RESTRICT,
	status_id INT NOT NULL REFERENCES educational_status(id) ON DELETE RESTRICT
);

CREATE TABLE individual_course (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	type individual_course_type NOT NULL,
	educator_id INT NOT NULL REFERENCES educator(id) ON DELETE RESTRICT,
	load INT NOT NULL CHECK (load > 0),
	room_id INT NOT NULL REFERENCES room(id) ON DELETE RESTRICT
);

CREATE TABLE course_registration (
	student_id INT REFERENCES student(id) ON DELETE CASCADE,
	course_id INT REFERENCES individual_course(id) ON DELETE CASCADE,
	term SMALLINT CHECK (term BETWEEN 1 AND 12),
	score_value SMALLINT NOT NULL CHECK (score_value BETWEEN 0 AND 5),

	PRIMARY KEY (student_id, course_id, term)
);

CREATE TABLE score (
	id SERIAL PRIMARY KEY,
	discipline_id INT NOT NULL REFERENCES discipline(id) ON DELETE RESTRICT,
	educator_id INT REFERENCES educator(id) ON DELETE SET NULL,
	student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
	score_value SMALLINT NOT NULL CHECK (score_value BETWEEN 0 AND 5),
	term SMALLINT NOT NULL CHECK (term BETWEEN 1 AND 12)
);

CREATE TABLE article (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	publish_date DATE NOT NULL,
	publishing TEXT CHECK (publishing != '')
);

CREATE TABLE author (
	educator_id INT NOT NULL REFERENCES educator(id) ON DELETE CASCADE,
	article_id INT NOT NULL REFERENCES article(id) ON DELETE CASCADE,

	PRIMARY KEY (educator_id, article_id)
); 
