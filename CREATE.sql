CREATE TABLE IF NOT EXISTS PERFORMERS (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS GENRES (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS PERFORMERS_GENRES (
    id SERIAL PRIMARY KEY,
    performer_id INT NOT NULL REFERENCES PERFORMERS(id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES GENRES(id) ON DELETE CASCADE,
    UNIQUE (performer_id, genre_id)  
);

CREATE TABLE IF NOT EXISTS ALBUMS (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,           
    release_date DATE NOT NULL,
    UNIQUE (title)     
);

CREATE TABLE IF NOT EXISTS ALBUMS_PERFORMERS (
    id SERIAL PRIMARY KEY,
    performer_id INT NOT NULL REFERENCES PERFORMERS(id) ON DELETE CASCADE,
    album_id INT NOT NULL REFERENCES ALBUMS(id) ON DELETE CASCADE,
    UNIQUE (performer_id, album_id)  
);

CREATE TABLE IF NOT EXISTS TRACKS (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_date TIMESTAMP NOT NULL,
    album_id INT NOT NULL REFERENCES ALBUMS(id) ON DELETE CASCADE,
    duration INTERVAL NOT NULL,
    UNIQUE (title, album_id)  
);

CREATE TABLE IF NOT EXISTS COLLECTION (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,           
    release_date DATE NOT NULL,
    UNIQUE (title) 
);

CREATE TABLE IF NOT EXISTS COLLECTION_TRACKS (
    id SERIAL PRIMARY KEY,
    collection_id INT NOT NULL REFERENCES COLLECTION(id) ON DELETE CASCADE,           
    track_id INT NOT NULL REFERENCES TRACKS(id) ON DELETE CASCADE,
    UNIQUE (collection_id, track_id)  
);
