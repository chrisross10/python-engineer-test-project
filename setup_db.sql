CREATE DATABASE osl
  WITH OWNER = postgres
  TEMPLATE = template0
  ENCODING = 'UTF8'
  LC_COLLATE = 'C'
  LC_CTYPE = 'C'
  CONNECTION LIMIT = -1;

\c osl

CREATE TABLE public.team (
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL UNIQUE
);

CREATE TABLE public.company (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE public.member (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  company_id INT NOT NULL REFERENCES public.company ON DELETE RESTRICT
);

CREATE TABLE public.team_member (
  team_id INT NOT NULL REFERENCES public.team ON DELETE RESTRICT,
  member_id INT NOT NULL REFERENCES public.member ON DELETE RESTRICT
);



INSERT INTO public.team (id, name) VALUES (1, 'Engineering');
INSERT INTO public.company (id, name) VALUES (1, 'Old Street Labs');
INSERT INTO public.member (id, name, email, company_id) VALUES (1, 'Mike Waites', 'mike@mike.com', 1);
INSERT INTO public.team_member (team_id, member_id) VALUES (1, 1);
