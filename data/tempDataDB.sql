DROP TABLE IF EXISTS inspection;
DROP TABLE IF EXISTS med_card;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS ward;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS orders;



CREATE TABLE department(
	id_dep INT PRIMARY KEY AUTO_INCREMENT,
	name_dep TEXT NOT NULL,
	quantity_ward INT NOT NULL,
	floor INT NOT NULL,
	head_inits TEXT NOT NULL
);

CREATE TABLE patient(
	passport_pat INT PRIMARY KEY AUTO_INCREMENT,
	inits TEXT NOT NULL,
	address TEXT NOT NULL,
	birth_date DATE NOT NULL,
    login TEXT NOT NULL,
    password TEXT NOT NULL,
    image TEXT
);

CREATE TABLE ward(
	id_ward INT PRIMARY KEY AUTO_INCREMENT,
	type TEXT NOT NULL,
	capacity INT NOT NULL,
    id_dep INT NOT NULL,
    FOREIGN KEY (id_dep) REFERENCES department(id_dep)
);

CREATE TABLE doctor(
	id_doc INT PRIMARY KEY AUTO_INCREMENT,
	inits TEXT NOT NULL,
	specialization TEXT NOT NULL,
	passport int UNIQUE NOT NULL,
	address TEXT NOT NULL,
	birth_date DATE NOT NULL,
	employment_date DATE NOT NULL,
	dismissal_date DATE,
	login TEXT NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    image TEXT,
	id_dep INT NOT NULL,
    FOREIGN KEY (id_dep) REFERENCES department(id_dep)
);

CREATE TABLE med_card(
	id_mc INT PRIMARY KEY AUTO_INCREMENT,
	diagnosis TEXT NOT NULL,
	admission_date DATE NOT NULL,
	discharge_date DATE,
	id_doc INT NOT NULL,
	id_ward INT NOT NULL,
	passport_pat INT NOT NULL,
    FOREIGN KEY (id_doc) REFERENCES doctor(id_doc),
    FOREIGN KEY (id_ward) REFERENCES ward(id_ward),
    FOREIGN KEY (passport_pat) REFERENCES patient(passport_pat)
);

CREATE TABLE inspection(
	id_ins INT PRIMARY KEY AUTO_INCREMENT,
	date_ins DATE NOT NULL,
	verdict TEXT NOT NULL,
	id_doc INT NOT NULL,
	id_mc INT NOT NULL,
    FOREIGN KEY (id_doc) REFERENCES doctor(id_doc),
    FOREIGN KEY (id_mc) REFERENCES med_card(id_mc)
);

CREATE TABLE service(
	prod_id INT PRIMARY KEY AUTO_INCREMENT,
	prod_name TEXT NOT NULL,
	prod_price INT NOT NULL,
	prod_img TEXT
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	order_time DATETIME NOT NULL,
	price INT NOT NULL,
	buyer_id INT NOT NULL,
    FOREIGN KEY (buyer_id) REFERENCES patient(passport_pat)
);



INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Диагностика', 12000, 'skoraya.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Анализы', 3000, 'skoraya-_11_.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Диспансеризация', 36000, 'skoraya-_2_.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Стоматология', 5000, 'skoraya-_9_.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Массаж', 4500, 'skoraya-_4_.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Справки', 1000, 'skoraya-_3_.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Вакцинация', 1500, 'skoraya-_1_.png');
INSERT INTO service(prod_name, prod_price, prod_img) VALUES('Вызов врача на дом', 7000, 'skoraya-_13_.png');



INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Хирургическое', 4, 1, 'Головин П. Д.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Кардиологическое', 3, 1, 'Бадыков И. И.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Травматологическое', 4, 2, 'Ерохин С. В.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Пульмонологическое', 4, 2, 'Оганнисян Г. В.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Неврологическое', 3, 3, 'Треус И. С.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Онкологическое', 2, 3, 'Бирюков И. Д.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Офтальмологическое', 3, 4, 'Бадретдинов Э. Р.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('ЛОР', 3, 4, 'Долгов И. В.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Эндокринологическое', 3, 5, 'Аверкиев А. М.');
INSERT INTO Department(name_dep, quantity_ward, floor, head_inits) VALUES('Реанимационное', 3, 5, 'Ярмухаметов И. Л.');



INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200000, 'Фахуртдинов Р. С.', 'г. Москва, ул. Сталеваров 15', '1970-01-28', 'fah', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200001, 'Карпачев А. Ю.', 'г. Москва, проспект Академиков 1', '1955-06-08', 'kar', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200002, 'Баранов И. В.', 'г. Москва, ул. Кащенко 228', '1995-10-28', 'bar', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200003, 'Маймултдинов В. Г.', 'г. Дербент, ул. Воинов 23', '2003-03-01', 'may', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200004, 'Алимов Г. Г.', 'г. Краснодар, ул. Первомайская 230', '1991-11-27', 'ali', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200005, 'Томашпольский В. Я.', 'г. Москва, Курский проспект 69', '1975-11-11', 'tom', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200006, 'Павельева Е. Б.', 'г. Москва, площадь Типарёва 3', '1973-03-21', 'pav', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200007, 'Тюленев А. В.', 'г. Москва, ул. Немирова 153', '1969-07-16', 'tul1', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200008, 'Тюленева М. В.', 'г. Москва, ул. Немирова 153', '1972-08-16', 'tul2', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200009, 'Тимков И. С.', 'г. Ставрополь, мкр. Горный 9', '2002-07-03', 'tim', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200010, 'Зудина О. В.', 'г. Москва, переулок Цветной 3', '1994-01-01', 'zud', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200011, 'Сусакова С. А.', 'г. Котовск, ул. Полежайкина 33', '2003-09-30', 'sus', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200012, 'Маруф Х. Н.', 'г. Москва, ул. Гольянова 538', '2002-01-02', 'mar', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200013, 'Бадаев А. В.', 'г. Элиста, ул. Бадмаева 8', '2003-07-13', 'bad', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200014, 'Павлов Н. В.', 'г. Чебоксары, ул. Писателей 39', '2003-05-12', 'pav', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200015, 'Бейтман П. Д.', 'г. Москва, ул. Малая Бронная 27', '1995-05-27', 'bey', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200016, 'Магомадов Ш. А.', 'г. Хасавюрт, ул. Армавирская 95', '2001-12-21', 'mag', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200017, 'Александров М. В.', 'г. Москва, Курский проспект 68', '2002-04-11', 'ale', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200018, 'Хуснетдинов Т. Р.', 'г. Москва, ул. Штуцера 30', '1986-02-19', 'hus', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200019, 'Смирнова Я. П.', 'г. Смоленск, ул. Кольская 44', '1966-01-31', 'smi', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200020, 'Басова М. О.', 'г. Москва, Сиреневый бульвар 83А', '1977-10-22', 'bas', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200021, 'Акбатыров Ж. А.', 'г. Омск, переулок Казахов 13', '2000-09-28', 'akb', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200022, 'Муталибов Р. Ш.', 'г. Махачкала, мкр. Крыша 12', '1998-02-28', 'mut', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200023, 'Шиз А. Д.', 'г. Москва, ул. Кащенко 209', '2003-10-22', 'shi', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200024, 'Каманина М. Г.', 'г. Звенигород, ул. Кентов 10', '2004-01-19', 'kam', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200025, 'Доброрадных К. В.', 'г. Москва, ул. Актёров 3', '2002-09-17', 'dob', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200026, 'Понулямных К. В', 'г. Москва, ул. Братьев Алёхиных 8', '2002-09-18', 'pon', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200027, 'Злорадных К. В.', 'г. Москва, ул. Врагов Народа 1', '2002-09-19', 'zlo', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200028, 'Доброзлых К. В.', 'г. Москва, переулок Здравченко 12', '2002-09-20', 'dzl', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200029, 'Злогрустных К. В.', 'г. Москва, ул. Врагов Народа 1', '2002-09-19', 'zlg', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200030, 'Кочегар Ф. О.', 'г. Красноярск, ул. Чулымская 63', '1982-04-21', 'koc', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200031, 'Сибирко Д. А.', 'г. Москва, Измайловский проспект 73А', '2001-12-17', 'sib', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200032, 'Шамин М. C.', 'г. Москва, Рощинский бульвар 52', '2002-09-18', 'sha', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200033, 'Шмурденко П. П.', 'г. Брянск, ул. Зелёная 17', '2000-04-06', 'shm', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200034, 'Сидоренко П. М.', 'г. Москва, Измайловский проспект 73А', '2000-10-07', 'sid', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200035, 'Князева С. В.', 'г. Москва, переулок Цветной 12', '1990-02-23', 'kny', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200036, 'Ратанова К. Д.', 'г. Пенза, ул. Ленина 82', '1978-02-10', 'rat', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200037, 'Орлова Е. Б.', 'г. Краснодар, ул. Горина 8', '1987-09-05', 'orl', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200038, 'Маркова А. Е.', 'г. Элиста, мкр. Молодёжный 12', '1987-03-21', 'mar', 123);
INSERT INTO Patient(passport_pat, inits, address, birth_date, login, password) VALUES(200039, 'Фомина В. Я.', 'г. Омск, ул. Миронова 73', '1962-03-05', 'fom', 123);



INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(11, 'Обычная', 4, 1);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(12, 'Обычная', 4, 1);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(13, 'VIP', 1, 1);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(14, 'Реанимационная', 2, 1);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(15, 'Обычная', 4, 2);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(16, 'Обычная', 4, 2);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(17, 'Реанимационная', 2, 2);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(21, 'Обычная', 4, 3);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(22, 'Обычная', 4, 3);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(23, 'VIP', 1, 3);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(24, 'VIP', 1, 3);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(25, 'Обычная', 4, 4);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(26, 'Обычная', 4, 4);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(27, 'VIP', 1, 4);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(28, 'Реанимационная', 2, 4);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(31, 'Обычная', 4, 5);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(32, 'Обычная', 4, 5);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(33, 'VIP', 1, 5);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(34, 'Обычная', 4, 6);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(35, 'VIP', 1, 6);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(41, 'Обычная', 4, 7);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(42, 'Обычная', 4, 7);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(43, 'VIP', 1, 7);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(44, 'Обычная', 4, 8);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(45, 'Обычная', 4, 8);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(46, 'VIP', 1, 8);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(51, 'Обычная', 4, 9);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(52, 'Обычная', 4, 9);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(53, 'VIP', 1, 9);

INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(54, 'Реанимационная', 4, 10);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(55, 'Реанимационная', 4, 10);
INSERT INTO Ward(id_ward, type, capacity, id_dep) VALUES(56, 'Реанимационная', 4, 10);



INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Головин П. Д.', 'Хирург', 100000, 'г. Москва, ул. Кащенко 12', '1977-05-31', '2005-09-19', 'gol', '456', 'head', 'pashka.jpg', 1);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Зуюнов М. А.', 'Нейро-Кардио хирург', 100001, 'г. Москва, ул. Душанбинская 22', '1984-11-24', '2013-04-01', 'zuy', '456', 'doctor', 'tadj.jpg', 1);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Шпичко А. Д.', 'Гнойный хирург', 100002, 'г. Москва, ул. Пензенская 77', '1992-10-12', '2021-03-17', 'shp', '456', 'doctor', 'sin.jpg', 1);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Бадыков И. И.', 'Кардиолог', 100003, 'г. Москва, ул. Татарская 16', '1970-05-22', '2007-02-26', 'badik', '456', 'head', 'ded.jpg', 2);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Кольчев М. Л.', 'Кардиолог', 100004, 'г. Москва, Румынский бульвар 22', '1990-11-21', '2017-07-19', 'kol', '456', 'doctor', 'kolchev.jpg', 2);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Ерохин С. В.', 'Травматолог-ортопед', 100005, 'г. Москва, ул. Спортивная 91', '1974-05-05', '2011-12-26', 'ero', '456', 'head', 'savva.jpg', 3);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Киселёв М. И.', 'Травматолог', 100006, 'г. Москва, Астраханская набережная 28', '1988-04-16', '2016-09-11', 'kis', '456', 'doctor', 'oleg.jpg', 3);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Оганнисян Г. В.', 'Пульмонолог', 100007, 'г. Москва, ул. Армянская 5', '1962-08-21', '1996-06-01', 'oga', '456', 'head', 'gamlet.jpg', 4);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Симонов М. Д.', 'Терапевт', 100008, 'г. Москва, Смоленская площадь 63', '1991-09-11', '2013-04-22', 'sim', '456', 'doctor', 'shaman.jpg', 4);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Треус И. С.', 'Невролог', 100009, 'г. Москва, ул. Малая Бронная 27', '1980-05-27', '2009-11-01', 'tre', '456', 'head', 'trevis.jpg', 5);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Кожуров М. В.', 'Невролог', 100010, 'г. Москва, Смоленская площадь 62', '1991-12-19', '2013-04-22', 'koz', '456', 'doctor', 'mansur.jpg', 5);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Бирюков И. Д.', 'Онколог', 100011, 'г. Москва, ул. Пригожина 97', '1981-06-27', '2009-03-10', 'bir', '456', 'head', 'voin.jpg', 6);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Бадретдинов Э. Р.', 'Офтальмолог', 100012, 'г. Москва, ул. Салавата Юлаева 1', '1962-05-28', '1996-06-01', 'badr', '456', 'head', 'negr.jpg', 7);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Долгов И. В.', 'ЛОР', 100013, 'г. Москва, мкр. Дубовый 3', '1967-08-29', '2008-03-01', 'dol', '456', 'head', 'kaban.jpg', 8);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Аверкиев А. М.', 'Эндокринолог', 100014, 'г. Москва, Краснопресненская набережная 66', '1974-12-12', '2006-01-14', 'ave', '456', 'head', 'slon.jpg', 9);

INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Ярмухаметов И. Л.', 'Реаниматолог', 100015, 'г. Москва, ул. Кентов 13', '1977-06-16', '2007-07-07', 'uar', '456', 'head', 'ilfat.jpg', 10);
INSERT INTO Doctor(inits, specialization, passport, address, birth_date, employment_date, login, password, role, image, id_dep) VALUES('Гирфанова Э. Б.', 'Анестезиолог', 100016, 'г. Москва, ул. Курьянова 42', '1987-03-31', '2021-03-03', 'gir', '456', 'doctor', 'elya.jpg', 10);



INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Перелом пальца', '2017-06-22', '2017-06-29', 7, 23, 200000);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Аппендицит', '2017-03-06', '2017-03-13', 1, 17, 200000);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Стенокардия', '2015-07-01', '2015-07-15', 4, 15, 200001);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Невроз', '2020-09-12', '2020-09-26', 11, 31, 200002);
INSERT INTO Med_card(diagnosis, admission_date, id_doc, id_ward, passport_pat) VALUES('Рак мозга', '2023-02-14', 12, 34, 200003);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Радикулит', '2014-11-23', '2014-12-7', 11, 31, 200004);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Фурункулёз', '2023-02-11', '2023-02-25', 3, 11, 200004);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Гайморит', '2017-02-16', '2017-03-02', 14, 23, 200005);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Бронхит', '2019-09-11', '2019-09-25', 8, 27, 200006);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Цирроз', '2021-01-06', '2021-01-10', 16, 54, 200007);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Инсульт', '2021-01-08', '2021-01-22', 11, 31, 200008);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Перелом малой берцовой кости', '2022-10-01', '2022-10-15', 7, 23, 200009);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Абсцесс', '2022-01-13', '2022-01-20', 3, 12, 200010);
INSERT INTO Med_card(diagnosis, admission_date, id_doc, id_ward, passport_pat) VALUES('Перелом ребра', '2023-02-17', 6, 24, 200011);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Ожог 3-ей степени', '2022-08-30', '2022-09-13', 1, 14, 200012);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Гипертиреоз', '2016-05-12', '2016-05-26', 15, 51, 200013);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Множественные переломы', '2022-06-24', '2022-07-03', 16, 56, 200014);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Инсульт', '2020-03-12', '2020-04-12', 10, 33, 200015);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Инфаркт', '2020-11-16', '2020-11-30', 5, 16, 200016);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Сердечный приступ', '2020-09-03', '2020-09-07', 16, 55, 200017);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Рак крови', '2018-02-12', '2018-03-12', 12, 34, 200018);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Тиреотоксическая аденома', '2015-04-16', '2015-04-30', 15, 53, 200019);
INSERT INTO Med_card(diagnosis, admission_date, id_doc, id_ward, passport_pat) VALUES('Глаукома', '2023-02-26', 13, 43, 200019);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Катаракта', '2019-11-03', '2019-11-24', 13, 42, 200020);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Ларингит', '2020-11-06', '2020-11-20', 14, 45, 200021);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Эмфизема', '2022-05-02', '2022-05-09', 9, 26, 200021);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Ревматизм', '2018-11-06', '2018-11-20', 4, 16, 200022);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Муковисцидоз', '2015-10-04', '2015-10-25', 8, 28, 200023);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Флегмона', '2023-02-28', '2023-03-14', 3, 12, 200024);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Кардиомиопатия', '2020-07-06', '2020-07-23', 5, 16, 200025);
INSERT INTO Med_card(diagnosis, admission_date, id_doc, id_ward, passport_pat) VALUES('Сколиоз', '2023-02-01', 6, 24, 200026);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Перелом лучевой кости', '2019-05-08', '2019-05-14', 7, 21, 200027);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Бронхиальная астма', '2020-11-03', '2020-11-17', 8, 25, 200027);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Хронический бронхит', '2022-01-22', '2022-02-08', 9, 26, 200028);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Мигрень', '2020-12-06', '2020-12-13', 10, 33, 200029);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Мигрень', '2021-05-20', '2021-05-27', 10, 33, 200029);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Энцефалопатия', '2022-02-01', '2022-02-15', 11, 32, 200030);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Рак лёгких', '2021-06-06', '2021-07-06', 12, 35, 200031);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Глаукома', '2016-11-16', '2016-11-30', 13, 41, 200032);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Синусит', '2021-09-01', '2021-09-15', 14, 44, 200033);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Аутоиммунный тиреоидит', '2022-07-14', '2022-08-04', 15, 52, 200033);
INSERT INTO Med_card(diagnosis, admission_date, id_doc, id_ward, passport_pat) VALUES('Разрыв мягких тканей', '2023-02-14', 16, 54, 200034);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Перитонит', '2018-07-04', '2018-07-27', 1, 14, 200035);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Гидраденит', '2020-08-03', '2020-08-17', 3, 13, 200036);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Тромбоэмболия', '2014-10-11', '2014-10-25', 4, 16, 200037);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Перелом ключицы', '2019-07-11', '2019-07-25', 6, 24, 200037);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Муковисцидоз', '2022-11-04', '2022-11-25', 8, 27, 200038);
INSERT INTO Med_card(diagnosis, admission_date, discharge_date, id_doc, id_ward, passport_pat) VALUES('Остеохондроз', '2017-04-06', '2017-04-20', 10, 32, 200039);



INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2017-06-29', 'Кость поставлена правильно, можно выписывать. Не нагружать травмированную конечность', 7, 1);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2017-03-09', 'Ткани успешно срастаются, начинайте больше двигаться. Придерживайтесь диеты', 1, 2);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2015-07-08', 'Пациент идёт на поправку, ещё неделю будет под наблюдением. Много переживает, направляю на обследование у невролога', 4, 3);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2015-07-09', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 11, 3);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-09-12', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 11, 4);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-14', 'Назначен курс химиотерапии. После ремиссии будет удалена злокачественная опухоль', 12, 5);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-03-11', 'Операция прошла успешно', 1, 5);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2014-11-25', 'Никакой физической нагрузки, постельный режим', 11, 6);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-03', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 3, 7);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2017-02-16', 'Назначены промывание носа, КУФ, диета. В случае неэффективности лечения будет сделано прокаливание', 14, 8);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2019-09-13', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 8, 9);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-01-06', 'Тяжелая операция, потребовалась трансплантация печени. Пациент в стабильном состоянии', 16, 10);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-01-08', 'Тяжелая операция, тромбоз. Пациент в стабильном состоянии', 2, 11);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-01-18', 'Пациент в полном порядке, после окончания курса терапии можно выписываться', 11, 11);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-10-01', 'Операция прошла успешно, вставлен штифт на малую берцовую кость', 7, 12);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-01-13', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 3, 13);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-17', 'Операция прошла успешно', 6, 14);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-08-30', 'Состояние после операции стабилизированно, требуется пересадка кожи', 1, 15);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-09-10', 'Пациент в хорошем состоянии, назначен курс лекарств', 1, 15);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2016-05-12', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 15, 16);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-06-24', 'Рассчитана доза анестезии, пациент готов к операции', 17, 17);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-06-24', 'Операция прошла успешно', 16, 17);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-03-12', 'Операциям прошла успешно', 2, 18);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-04-12', 'Пациент полность здоров, после выписки назначено наблюдение у врача в поликлинике', 10, 18);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-11-16', 'Операциям прошла успешно', 2, 19);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-11-30', 'Пациент полность здоров, после выписки назначено наблюдение у врача в поликлинике', 16, 19);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-09-03', 'Пациент в стабильном состоянии, после курса терапии требуется осмотр у невролога', 16, 20);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-09-06', 'Имеется симптомы невроза после перенесенного, назначен курс лекарств и повторный приём в поликлинике', 11, 20);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2018-02-12', 'Назначен курс химиотерапии. После ремиссии будет удалена злокачественная опухоль', 12, 21);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2018-03-05', 'Операция прошла успешно', 1, 21);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2015-04-16', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 15, 22);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-26', 'Проведена операция лазерной коррекции', 13, 23);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2019-11-03', 'Проведена операция лазерной коррекции', 13, 24);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-11-06', 'Назначен КУФ, диета', 14, 25);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-05-03', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 9, 26);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2018-11-06', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 4, 27);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2015-10-06', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 8, 28);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-03-01', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 3, 29);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-07-09', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 5, 30);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-01', 'Назначен курс физиотерапии', 6, 31);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2019-05-08', 'Вставили кость в правильное положение, наложен гипс. Назначен постельный режим', 7, 32);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-11-05', 'Назначен курс физиотерапии', 8, 33);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-01-22', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 9, 34);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-12-06', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Есть признаки болезней сердца, назначен приём у кардиолога', 10, 35);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-12-07', 'С сердцем проблем нет', 5, 35);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-05-20', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 10, 36);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-02-01', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Рекомендуется осмотр у Треуса И. С.', 11, 37);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-02-10', 'Лечение идёт правильно, пациент идёт на поправку', 10, 37);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-06-06', 'Назначен курс химиотерапии. После ремиссии будет удалена злокачественная опухоль', 12, 38);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-06-29', 'Операция прошла успешно', 1, 38);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2016-11-20', 'Проведена операция лазерной коррекции', 13, 39);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2021-09-01', 'Назначен КУФ, диета', 14, 40);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-07-14', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 15, 41);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-14', 'Рассчитана доза анестезии, пациент готов к операции', 17, 42);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2023-02-14', 'Операция прошла успешно', 16, 42);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2018-07-04', 'Нужно проведение срочной операции с участиием Шпичко А. Д.', 1, 43);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2018-07-04', 'Операция прошла успешно', 3, 43);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-08-03', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков. Также рекомендуется пройти гормональное обследование у Аверкиева А. М.', 3, 44);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2020-08-07', 'С гормональным фоном всё в порядке', 15, 44);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2014-10-16', 'Пациент идёт на поправку, ещё неделю будет под наблюдением. Много переживает, направляю на обследование у невролога', 4, 45);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2014-10-22', 'Выписаны лекарства, рекомендуется пропить полный курс и отказаться от стресса. Повторный приём в поликлинику после курса лечения', 11, 45);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2019-07-11', 'Наложен гипс, соблюдать постельный режим', 6, 46);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2022-11-07', 'Воспаление возможно вылечить медикаментозно, назначен курс антибиотиков', 8, 47);
INSERT INTO Inspection(date_ins, verdict, id_doc, id_mc) VALUES('2017-04-06', 'Никакой физической нагрузки, постельный режим', 10, 48);