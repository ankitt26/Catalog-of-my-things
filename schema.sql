CREATE DATABASE catalog_of_my_things;

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(256),
    color VARCHAR(256)
);