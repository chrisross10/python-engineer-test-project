CREATE DATABASE osl
  WITH OWNER = postgres
  TEMPLATE = template0
  ENCODING = 'UTF8'
  LC_COLLATE = 'C'
  LC_CTYPE = 'C'
  CONNECTION LIMIT = -1;


CREATE TABLE public.team (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL UNIQUE
);
