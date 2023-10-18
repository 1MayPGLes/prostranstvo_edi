-- Создаем таблицу отделений
CREATE TABLE IF NOT EXISTS Department(
	id_dep INTEGER PRIMARY KEY AUTOINCREMENT,
	name_dep TEXT NOT NULL,
	quantity_ward INT NOT NULL,
	floor INTEGER NOT NULL,
	head_inits TEXT NOT NULL
);

-- Создаем таблицу пациентов
CREATE TABLE IF NOT EXISTS Patient(
	passport_pat INTEGER PRIMARY KEY,
	inits TEXT NOT NULL,
	address TEXT NOT NULL,
	birth_date DATE NOT NULL
);

-- Создаем таблицу палат
CREATE TABLE IF NOT EXISTS Ward(
	id_ward INTEGER PRIMARY KEY,
	type TEXT NOT NULL,
	capacity INTEGER NOT NULL,
    id_dep INTEGER NOT NULL,
    FOREIGN KEY (id_dep) REFERENCES Department(id_dep)
);

-- Создаем таблицу докторов
CREATE TABLE IF NOT EXISTS Doctor(
	id_doc INTEGER PRIMARY KEY AUTOINCREMENT,
	inits TEXT NOT NULL,
	specialization TEXT NOT NULL,
	passport INTEGER UNIQUE NOT NULL,
	address TEXT NOT NULL,
	birth_date DATE NOT NULL,
	employment_date DATE NOT NULL,
	dismissal_date DATE,
	id_dep INTEGER NOT NULL,
	FOREIGN KEY (id_dep) REFERENCES Department(id_dep)
);

-- Создаем таблицу историй болезни
CREATE TABLE IF NOT EXISTS Med_card(
	id_mc INTEGER PRIMARY KEY AUTOINCREMENT,
	diagnosis TEXT NOT NULL,
	admission_date DATE NOT NULL,
	discharge_date DATE,
	id_doc INTEGER NOT NULL,
	id_ward INTEGER NOT NULL,
	passport_pat INTEGER NOT NULL,
	FOREIGN KEY (id_doc) REFERENCES Doctor(id_doc),
	FOREIGN KEY (id_ward) REFERENCES Ward(id_ward),
	FOREIGN KEY (passport_pat) REFERENCES Patient(passport_pat)
);

-- Создаем таблицу осмотров
CREATE TABLE IF NOT EXISTS Inspection(
	id_ins INTEGER PRIMARY KEY AUTOINCREMENT,
	date_ins DATE NOT NULL,
	verdict TEXT NOT NULL,
	id_doc INTEGER NOT NULL,
	id_mc INTEGER NOT NULL,
	FOREIGN KEY (id_doc) REFERENCES Doctor(id_doc),
	FOREIGN KEY (id_mc) REFERENCES Med_card(id_mc)
);

-- Создаем таблицу осмотров
CREATE TABLE IF NOT EXISTS User(
	id_use INTEGER PRIMARY KEY AUTOINCREMENT,
	name_use TEXT NOT NULL,
	email_use TEXT NOT NULL,
	psw TEXT NOT NULL,
	time_use INTEGER NOT NULL
);