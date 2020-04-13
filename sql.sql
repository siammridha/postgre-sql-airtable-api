-- -----------------------------------------------------
-- SHOW all Tables
-- -----------------------------------------------------
SELECT table_name FROM information_schema.tables WHERE table_schema='public';

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS users_apps;
DROP TABLE IF EXISTS positions_apps;
DROP TABLE IF EXISTS apps_scopes;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS apps;
DROP TABLE IF EXISTS scopes;
-- -----------------------------------------------------
-- Table positions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS positions (
  name VARCHAR(50) PRIMARY KEY,
  description VARCHAR(225) NOT NULL
);
INSERT INTO positions (name, description) VALUES('CEO', 'the CEO of the company');
INSERT INTO positions (name, description) VALUES('Software Developer', 'Software Developer');

-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  email VARCHAR(225) PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  position VARCHAR REFERENCES positions (name) ON DELETE CASCADE
);
INSERT INTO users(email, first_name,last_name) VALUES('siam@sharedStudios.com', 'Siam', 'Mridha');


-- -----------------------------------------------------
-- Table apps
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS apps (
  name VARCHAR(50) PRIMARY KEY,
  description VARCHAR(225) NOT NULL
);
INSERT INTO apps (name, description) VALUES('app1', 'this is test app1');
INSERT INTO apps (name, description) VALUES('app2', 'this is test app2');


-- -----------------------------------------------------
-- Table scops
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS scopes (
  name VARCHAR(20) PRIMARY KEY,
  description VARCHAR(225) NOT NULL
);
INSERT INTO scopes(name, description)VALUES('READ:USERS', 'can query all the users in the table');
INSERT INTO scopes(name, description)VALUES('WRITE:USERS', 'can create/updata/delete users');
INSERT INTO scopes(name, description)VALUES('WRITE:APPS', 'can create/updata/delete apps');
INSERT INTO scopes(name, description)VALUES('WRITE:SCOPE', 'can create/updata/delete scope');
INSERT INTO scopes(name, description)VALUES('WRITE:POSITIONS', 'can create/updata/delete position');

-- -----------------------------------------------------
-- Table users_apps
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS users_apps (
  user_email VARCHAR REFERENCES users (email) ON DELETE CASCADE,
  app_name VARCHAR REFERENCES apps (name) ON DELETE CASCADE,
  CONSTRAINT users_apps_id PRIMARY KEY (user_email,app_name)
);


-- -----------------------------------------------------
-- Table positions_apps
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS positions_apps (
  position_name VARCHAR REFERENCES positions (name) ON DELETE CASCADE,
  app_name VARCHAR REFERENCES apps (name) ON DELETE CASCADE,
  CONSTRAINT positions_apps_id PRIMARY KEY (position_name,app_name)
);



-- -----------------------------------------------------
-- Table apps_scops
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS apps_scopes (
  app_name VARCHAR REFERENCES apps (name) ON DELETE CASCADE,
  scope_name VARCHAR REFERENCES scopes (name) ON DELETE CASCADE,
  CONSTRAINT apps_scopes_id PRIMARY KEY (app_name, scope_name)
);



INSERT INTO users_apps(user_email,app_name) VALUES('siam@sharedStudios.com','app1');


INSERT INTO apps_scopes(app_name, scope_name) VALUES('app1', 'READ:USERS');
INSERT INTO apps_scopes(app_name, scope_name) VALUES('app1', 'WRITE:USERS');

INSERT INTO positions_apps(position_name,app_name) VALUES('Software Developer','app1');

UPDATE users SET  podition='Software Developer' WHERE email = 'siam@sharedStudios.com';


ALTER TABLE TEST
ALTER COLUMN first_name TYPE VARCHAR(20),
ADD COLUMN test VARCHAR(20) NOT NULL;

ALTER TABLE TEST RENAME COLUMN first_name to F_name


-- -----------------------------------------------------
-- Table tables
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tables (
  id UUID PRIMARY KEY NOT NULL,
  name VARCHAR NOT NULL UNIQUE
);

-- -----------------------------------------------------
-- Table columns
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS columns (
  column_id UUID NOT NULL,
  name VARCHAR NOT NULL,
  key VARCHAR,
  type VARCHAR NOT NULL,
  not_null BOOLEAN NOT NULL,
  default_value VARCHAR,
  table_name UUID NOT NULL REFERENCES tables (id) ON DELETE CASCADE,
  PRIMARY KEY(column_id, table_name)
);