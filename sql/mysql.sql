CREATE TABLE IF NOT EXISTS user (
    id           INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255),
    email        VARCHAR(255),
    password     VARCHAR(255) 
);

CREATE TABLE IF NOT EXISTS book(
  id           INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  url VARCHAR(255),
  artistName VARCHAR(255),
  itemurl VARCHAR(255)
);
