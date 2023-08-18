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

CREATE TABLE source (
    id SERIAL PRIMARY KEY,
    name VARCHAR(256)
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER REFERENCES genre(id),
    author_id INTEGER REFERENCES author(id),
    source_id INTEGER REFERENCES source(id),
    label_id INTEGER REFERENCES label(id),
    publish_date DATE
);

CREATE TABLE book (
    id INTEGER PRIMARY KEY REFERENCES item(id),
    publisher VARCHAR(256),
    cover_state VARCHAR(256)
);

CREATE TABLE music_album (
    id INTEGER PRIMARY KEY REFERENCES item(id),
    on_spotify BOOLEAN
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY REFERENCES item(id),
    multiplayer VARCHAR(256),
    last_played_at DATE
);

CREATE TABLE movie (
    id INTEGER PRIMARY KEY REFERENCES item(id),
    silent BOOLEAN
);