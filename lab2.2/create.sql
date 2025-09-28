CREATE TYPE account_status AS ENUM ('student', 'educator', 'admin');
CREATE TABLE account (
	id serial,
	login varchar(32) UNIQUE NOT NULL,
	password varchar(32) NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	birth_date date NOT NULL,
	email varchar(64),
	phone varchar(15),
	status account_status

	CONSTRAINT pk_account_id PRIMARY KEY(id)
);

CREATE TABLE educator (
	id serial PRIMARY KEY,
	account_id int,
	degree varchar
);


