--Tablas de AmongMeme

DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapons_types;

DROP TABLE IF EXISTS characters_armor;
DROP TABLE IF EXISTS armor;
DROP TABLE IF EXISTS armor_types;

DROP TABLE IF EXISTS skills;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters;


CREATE TABLE characters(
	id_character INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(24) NOT NULL,
	age INT NOT NULL,
	hp INT NOT NULL,
	gender CHAR(1) NOT NULL,
	style CHAR(1) NOT NULL,
	mana INT NOT NULL,
	class CHAR(2) NOT NULL,
	race CHAR(2) NOT NULL,
	xp INT NOT NULL,
	level INT NOT NULL,
	height FLOAT NOT NULL
);

INSERT INTO characters (name,age,hp,gender,style,mana,class,race,xp,`level`,height) 
VALUES
	('Jacinto',12309,999,'F','R',100000,'Mg','Sg',1000000,0,2.1),
	('Alejandro',2,0,'M','M',1,'De','Nd',100,2,1.2),
	('Paca',43,100,'F','G',0,'Wa','Lo',500,70,4.52),
	('Maricarmen',2,100,'N','H',100,'T','B',200,100,0.25);

CREATE TABLE stats(
	id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	intel INT NOT NULL,
	strength INT NOT NULL,
	charisma INT NOT NULL,
	`level` INT NOT NULL,
	id_character INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character)
);

INSERT INTO stats (intel,strength,charisma,`level`,id_character) 
VALUES
	(33,22,333,33,1),(1,1,1,1,2),(75,2000,60,70,3),(9999,20,1,10,4);

CREATE TABLE skills(
    id_skill INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    skill VARCHAR(24) NOT NULL,
    description TEXT,
    icon VARCHAR(16) NOT NULL
);

CREATE TABLE items_types(
    id_item_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(16) NOT NULL
);

INSERT INTO items_types (type)
VALUES
	("Equipable"), ("Consumible"), ("Otros"), ("Clave");

CREATE TABLE items(
    id_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	item VARCHAR(24) NOT NULL,
    cost INT NOT NULL,
    consumable BOOLEAN NOT NULL,
    tradeable BOOLEAN NOT NULL,
    weight FLOAT NOT NULL,
    image VARCHAR(32),
    description TEXT,
    id_item_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_item_type) REFERENCES items_types(id_item_type)
);

INSERT INTO items (item,cost,consumable,tradeable,weight,image,description,id_item_type)
VALUES
	("Poción de vida", 25, true, true, 1, "pocion.png", "Una poción para recuperar vida.", 2),
	("Antídoto", 20, true, true, 1, "antidoto.png", "Un antídoto para eliminar veneno.", 2),
	("Gafas de sol", 150, false, true, 0, "gafassol.png", "Unas gafas que te protegen de la luz cegadora producida por el sol.", 1),
	("Pedrusco", 5, false, true, 5, "guijarro.png", "Una piedra normal y corriente que te has guardado en el bolsillo porque te apetecía.", 3),
	("Agua del río", 0, true, false, 2, "aguario.png", "No huele muy bien. Probablemente no es buena idea beberla...", 4),
	("Anillo de oro", 5000, false, true, 5, "anillooro.png", "Es tuyo, tu tesoro.", 1),
	("Arena de gato", 10, false, true, 3, "arenagato.png", "Guardarse arena de gato en el bolsillo no es muy higiénico... Lanzarlo a un enemigo le puede causar ceguera y náuseas.", 3),
	("Portátil chungo", 700, false, true, 7, "portatilchungo.png", "Este portátil está un poco pachucho.", 4);

CREATE TABLE characters_items (
    id_character_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_character INT UNSIGNED NOT NULL,
    id_item INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_item) REFERENCES items(id_item)
);

INSERT INTO characters_items (id_character,id_item) 
VALUES 
	(1,1), (1,3), (2,4), (2,7), (3,2), (3,5), (4,6);

CREATE TABLE weapons_types(
    id_weapon_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(24) NOT NULL
);

INSERT INTO weapons_types(type) 
VALUES 
	('Espada'),('Mangual'),('Paraguas');

CREATE TABLE weapons(
	id_weapon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    weapon VARCHAR(16) NOT NULL,
    damage INT NOT NULL,
    quality INT NOT NULL,
    rarity INT NOT NULL,
    weight INT NOT NULL,
    durability INT NOT NULL,
    `range` INT NOT NULL,
    id_weapon_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_weapon_type) REFERENCES weapons_types(id_weapon_type)
);

INSERT INTO weapons(weapon, damage, quality, rarity, weight, durability, `range`, id_weapon_type)
VALUES
	('Paraguas',5,1,1,5,50,3,3),
	('Espada de cobre',7,2,2,10,70,2,1),
	('Mangual',50,4,4,30,400,20,2),
	('Espada de hierro',10,3,3,10,100,3,1);

CREATE TABLE armor_types (
	id_armor_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(24) NOT NULL
);

INSERT INTO armor_types(type) 
VALUES 
	('Ligera'),('Mediana'),('Pesada');

CREATE TABLE armor(
	id_armor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    armor VARCHAR(16) NOT NULL,
    defence INT NOT NULL,
    durability INT NOT NULL,
    weight INT NOT NULL,
    quality INT NOT NULL,
    rarity INT NOT NULL,
    toughness INT NOT NULL,
    id_armor_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_armor_type) REFERENCES armor_types(id_armor_type)
);

CREATE TABLE characters_weapons(
	id_character_weapon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_character INT UNSIGNED NOT NULL,
    id_weapon INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);

INSERT INTO characters_weapons (id_character,id_weapon) 
VALUES 
	(1,3), (2,2), (3,4), (4,3);

CREATE TABLE characters_armor(
	id_character_armor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_character INT UNSIGNED NOT NULL,
    id_armor INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_armor) REFERENCES armor(id_armor)
);