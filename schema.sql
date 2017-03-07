create database salido_challenge

CREATE TABLE brand (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE brand_location(
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  brand_id bigint(20) unsigned NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (brand_id) REFERENCES brand (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE brand_order_type (
  brand_id bigint(20) unsigned NOT NULL,
  code varchar(50) NOT NULL,
  name varchar(50) NOT NULL,
  description varchar(256) NOT NULL,
  PRIMARY KEY(brand_id, code)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE brand_price_level (
  brand_id bigint(20) unsigned NOT NULL,
  code varchar(50) NOT NULL,
  name varchar(50) NOT NULL,
  description varchar(256) NOT NULL,
  PRIMARY KEY (brand_id, code)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE location_price_config (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  brand_id bigint(20) unsigned NOT NULL,
  location_id bigint(20) unsigned NOT NULL,
  day_part_code varchar(50) NOT NULL,
  order_type_code varchar(50) NOT NULL,
  price_level_code varchar(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (brand_id, order_type_code) REFERENCES brand_order_type
      (brand_id, code),
  FOREIGN KEY (brand_id, price_level_code) REFERENCES brand_price_level
      (brand_id, code)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE menu_item (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  brand_id bigint(20) unsigned,
  name varchar(50) NOT NULL,
  description varchar(256) NOT NULL,
  PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE brand_menu_item_price(
  menu_item_id bigint(20) unsigned NOT NULL,
  price_level_code varchar(50) NOT NULL,
  brand_id bigint(20) unsigned NOT NULL,
  price DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (menu_item_id, price_level_code, brand_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_item (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
