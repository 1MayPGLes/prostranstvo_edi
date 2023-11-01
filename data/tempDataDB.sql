SELECT * FROM product;

DROP TABLE product

CREATE TABLE product(
	prod_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_name TEXT NOT NULL,
    prod_price FLOAT NOT NULL,
    prod_measure TEXT NOT NULL,
    prod_category TEXT NOT NULL,
    prod_sale BOOL NOT NULL DEFAULT FALSE,
    prod_description TEXT NOT NULL,
    prod_img TEXT NOT NULL
);

CREATE TABLE external_user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_password TEXT NOT NULL,
    user_name TEXT NOT NULL,
    user_login TEXT NOT NULL
);

CREATE TABLE internal_user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_password TEXT NOT NULL,
    user_name TEXT NOT NULL,
    user_login TEXT NOT NULL,
    user_group TEXT NOT NULL
);

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (1, 'Пельмени', 400, 'кг', 'Полуфабрикаты', 1, 'Вкусные пельмени, добрые, позитивные', 'pelmeni.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (2, 'Чокопай', 140, 'пачка', 'Сладости', 0, 'Чокопайки))', 'chockopie.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (3, 'Куриная грудка', 300, 'кг', 'Мясо и рыба', 0, 'Курагрудки, много белка', 'kura.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (4, 'Азерчай', 250, 'пачка', 'Бакалея', 1, 'Азербайджанский чай, 100 пакетиков', 'azerchay.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (5, 'Добрый кола', 100, 'л', 'Напитки', 0, 'Вкусные пельмени, добрые, позитивные', 'kola.jpg');

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (6, 'Мальборо красный', 220, 'пачка', 'Сигареты', 1, 'Классический американский табак', 'marlboro.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (7, 'Чебупели', 170, 'пачка', 'Полуфабрикаты', 1, 'Закинул в микроволновку и вкусно', 'chebupeli.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (8, 'Фругурт', 100, 'л', 'Молочная продукция', 0, 'Вкусный йогурт, для крестьянского кайфа', 'frugurt.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (9, 'Цица', 230, 'л', 'Алкоголь', 0, 'Красное полусладкое вино изабеллла', 'tsitsa.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (10, 'Лоток яиц', 70, 'пачка', 'Бакалея', 1, 'Лоток яиц на завтрак', 'eggs.jpg');

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (11, 'Энергетик', 100, 'л', 'Напитки', 0, 'Для бессоных ночей', 'energy.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (12, 'Бананы', 130, 'кг', 'Фрукты и овощи', 1, 'Бананы, подорожали, грустно...', 'banana.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (13, 'Сосиски', 250, 'кг', 'Полуфабрикаты', 0, 'Основа студенческого рациона', 'sosiski.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (14, 'Пиво Hollandia баллон', 160, 'л', 'Алкоголь', 0, 'Легендарное пиво', 'hollandia.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (15, 'Батон хлеба', 55, 'шт', 'Бакалея', 1, 'Всему голова', 'hleb.jpg');

INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (16, 'Рис', 90, 'кг', 'Крупы', 1, 'Миска рис, кошка жена в подарок', 'ris.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (17, 'Треска', 600, 'кг', 'Мясо и рыба', 0, 'Филе белой рыбы', 'treska.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (18, 'Твикс', 60, 'шт', 'Сладости', 1, '2 шоколадных палочки с нугой и печеньем', 'twix.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (19, 'Помидоры Бакинские', 180, 'кг', 'Фрукты и овощи', 1, 'Помидоры Бакинские, новый урожай', 'tomatoes.jpg');
INSERT INTO product (prod_id, prod_name, prod_price, prod_measure, prod_category, prod_sale, prod_description, prod_img)
VALUES (20, 'Мыло', 30, 'шт', 'Косметика', 0, 'Мыло антибактериальное с ароматом ромашек', 'soap.jpg');
