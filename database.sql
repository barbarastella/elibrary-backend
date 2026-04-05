DROP TABLE IF EXISTS readings;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;

-- tabela de usuários
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_type VARCHAR(50) DEFAULT 'regular'
);

-- tabela de autores
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- tabela de gêneros
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- tabela de livros
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    publication_year INT,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE RESTRICT,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE RESTRICT
);

-- tabela de leituras
CREATE TABLE readings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('lido', 'lendo', 'quero_ler')),
    review TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE RESTRICT
);

-- ====================== mock data para teste ======================

INSERT INTO genres (name) VALUES 
('Ficção Científica'), 
('Fantasia'), 
('Romance Clássico');

INSERT INTO authors (name) VALUES 
('Fiódor Dostoiévski'), 
('Mary Shelley'), 
('Homero');

INSERT INTO books (title, author_id, genre_id, publication_year) VALUES 
('Crime e Castigo', 1, 3, 1866),
('Frankenstein', 2, 1, 1818),
('Ilíada', 3, 2, -750);