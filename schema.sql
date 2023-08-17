CREATE DATABASE catalog_of_my_things;

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(256),
    color VARCHAR(256)
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(256)
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(49),
    last_name VARCHAR(49)
);