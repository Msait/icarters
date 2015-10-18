CREATE TABLE users (
  username VARCHAR(50) NOT NULL PRIMARY KEY,
  password VARCHAR(50) NOT NULL,
  enabled BOOLEAN NOT NULL
);

CREATE TABLE user_roles (
  user_role_id SERIAL NOT NULL PRIMARY KEY,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  CONSTRAINT uni_username_role UNIQUE (role,username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username)
);

CREATE UNIQUE INDEX ON user_roles (username, role);

insert into users (username, password, enabled) values ('admin', 'password', true);
insert into authorities (username, authority) values ('admin', 'ADMIN');

insert into users (username, password, enabled) values ('user', 'password', true);
insert into authorities (username, authority) values ('user', 'USER');
