CREATE TABLE users (
  username VARCHAR(50)  NOT NULL PRIMARY KEY,
  password VARCHAR(255) NOT NULL,
  enabled  BOOLEAN      NOT NULL
);

CREATE TABLE IF NOT EXISTS roles (
  role_id BIGSERIAL NOT NULL PRIMARY KEY,
  role    VARCHAR(25) UNIQUE
);

CREATE TABLE IF NOT EXISTS users_roles (
  username varchar(45) NOT NULL,
  role_id  BIGINT      NOT NULL,
  CONSTRAINT uni_username_role UNIQUE (role_id, username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles (role_id)
);
-- password = 1
INSERT INTO roles (role) VALUES ('ROLE_ADMIN'), ('ROLE_USER'), ('ROLE_DEV');
INSERT INTO users (username, password, enabled)
VALUES ('admin', '$2a$11$Litn1NiTcHKJQKIaGUxITec994yozAz6HZW13FHKHY.XjvA2Et2JW', TRUE);
INSERT INTO users_roles (username, role_id) VALUES ('admin', (SELECT role_id
                                                              FROM roles
                                                              WHERE role = 'ROLE_ADMIN'));

-- password = 1
INSERT INTO users (username, password, enabled)
VALUES ('user', '$2a$11$Litn1NiTcHKJQKIaGUxITec994yozAz6HZW13FHKHY.XjvA2Et2JW', TRUE);
INSERT INTO users_roles (username, role_id) VALUES ('user', (SELECT role_id
                                                             FROM roles
                                                             WHERE role = 'ROLE_USER'));

-- password = 1
INSERT INTO users (username, password, enabled)
VALUES ('dev', '$2a$11$Litn1NiTcHKJQKIaGUxITec994yozAz6HZW13FHKHY.XjvA2Et2JW', TRUE);
INSERT INTO users_roles (username, role_id) VALUES ('dev', (SELECT role_id
                                                            FROM roles
                                                            WHERE role = 'ROLE_DEV'));
