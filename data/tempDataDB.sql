CREATE TABLE product(
	prod_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_name TEXT NOT NULL,
    prod_price FLOAT NOT NULL,
    prod_measure TEXT NOT NULL,
    prod_category TEXT NOT NULL,
    prod_sale BOOL NOT NULL DEFAULT FALSE,
    prod_description TEXT NOT NULL,
    prod_reg DATE NOT NULL,
    prod_img TEXT NOT NULL
);
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (1, 'Пельмени', 400, 'кг', 'Полуфабрикаты', 1, 'Вкусные пельмени, добрые, позитивные', '2023-01-12' , 'pelmeni.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (2, 'Чокопай', 140, 'пачка', 'Сладости', 0, 'Чокопайки))', '2010-11-12' , 'chockopie.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (3, 'Куриная грудка', 300, 'кг', 'Мясо и рыба', 0, 'Курагрудки, много белка', '2023-01-22' , 'kura.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (4, 'Азерчай', 250, 'пачка', 'Бакалея', 1, 'Азербайджанский чай, 100 пакетиков', '2023-04-15' , 'azerchay.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (5, 'Добрый кола', 100, 'л', 'Напитки', 0, 'Вкусные пельмени, добрые, позитивные', '2023-02-02' , 'kola.jpg');

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (6, 'Мальборо красный', 220, 'пачка', 'Сигареты', 1, 'Классический американский табак', '2023-02-27' , 'marlboro.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (7, 'Чебупели', 170, 'пачка', 'Полуфабрикаты', 1, 'Закинул в микроволновку и вкусно', '2023-03-11' , 'chebupeli.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (8, 'Фругурт', 100, 'л', 'Молочная продукция', 0, 'Вкусный йогурт, для крестьянского кайфа', '2023-05-14' , 'frugurt.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (9, 'Цица', 230, 'л', 'Алкоголь', 0, 'Красное полусладкое вино изабеллла', '2023-05-23' , 'tsitsa.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (10, 'Лоток яиц', 70, 'пачка', 'Бакалея', 1, 'Лоток яиц на завтрак', '2023-06-19' , 'eggs.jpg');

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (11, 'Энергетик', 100, 'л', 'Напитки', 0, 'Для бессоных ночей', '2023-06-04' , 'energy.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (12, 'Бананы', 130, 'кг', 'Фрукты и овощи', 1, 'Бананы, подорожали, грустно...', '2023-07-30' , 'banana.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (13, 'Сосиски', 250, 'кг', 'Полуфабрикаты', 0, 'Основа студенческого рациона', '2023-07-09' , 'sosiski.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (14, 'Пиво Hollandia баллон', 160, 'л', 'Алкоголь', 0, 'Легендарное пиво', '2023-08-16' , 'hollandia.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (15, 'Батон хлеба', 55, 'шт', 'Бакалея', 1, 'Всему голова', '2023-08-20' , 'hleb.jpg');

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (16, 'Рис', 90, 'кг', 'Крупы', 1, 'Миска рис, кошка жена в подарок', '2023-09-26' , 'ris.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (17, 'Треска', 600, 'кг', 'Мясо и рыба', 0, 'Филе белой рыбы', '2023-09-07' , 'treska.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (18, 'Твикс', 60, 'шт', 'Сладости', 1, '2 шоколадных палочки с нугой и печеньем', '2023-03-05' , 'twix.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (19, 'Помидоры Бакинские', 180, 'кг', 'Фрукты и овощи', 1, 'Помидоры Бакинские, новый урожай', '2023-10-12' , 'tomatoes.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_reg, prod_img)
VALUES (20, 'Мыло', 30, 'шт', 'Косметика', 0, 'Мыло антибактериальное с ароматом ромашек', '2023-11-01' , 'soap.jpg');



CREATE TABLE external_user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_password TEXT NOT NULL,
    user_name TEXT NOT NULL,
    user_login TEXT NOT NULL
);
INSERT INTO external_user (user_id, user_password, user_name, user_login)
VALUES (1, '123', 'leha', 'leha');



CREATE TABLE internal_user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_password TEXT NOT NULL,
    user_name TEXT NOT NULL,
    user_login TEXT NOT NULL,
    user_group TEXT NOT NULL
);
INSERT INTO internal_user (user_id, user_password, user_name, user_login, user_group)
VALUES (1, '456', 'dima', 'dima', 'buyer');
INSERT INTO internal_user (user_id, user_password, user_name, user_login, user_group)
VALUES (2, '789', 'egor', 'egor', 'admin');



CREATE TABLE report(
	report_id INT PRIMARY KEY AUTO_INCREMENT,
    report_year INT NOT NULL,
    report_month INT NOT NULL,
    prod_amount INT NOT NULL
);

DROP PROCEDURE IF EXISTS createReport;
delimiter //
CREATE PROCEDURE createReport(y INT, m INT)
BEGIN
    DECLARE cid INT;
	DECLARE done INT DEFAULT FALSE;
    
	DECLARE rep_cur CURSOR FOR
		SELECT COUNT(*)
		FROM product
		WHERE (YEAR(prod_reg) = y) AND (MONTH(prod_reg) = m);
    
	DECLARE EXIT HANDLER FOR SQLSTATE '02000'
    BEGIN
		SET done = TRUE;
	END;
	
	OPEN rep_cur;
    
	WHILE done != TRUE DO
		FETCH NEXT FROM rep_cur INTO cid;
		INSERT INTO report(report_year, report_month, prod_amount)
        VALUES(y, m, cid);
	END WHILE;
	
    CLOSE rep_cur;
END //