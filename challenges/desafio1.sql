DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos
(
	plano_id INT AUTO_INCREMENT PRIMARY KEY,
	plano VARCHAR(512) NOT NULL,
	valor DOUBLE NOT NULL
);

INSERT INTO planos (plano, valor) VALUES
	('gratuito', 0),
	('universitário', 5.99),
	('pessoal', 6.99),
	('familiar', 7.99);

	CREATE TABLE pessoas_usuarias
(
    pessoa_usuaria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_pessoa_usuaria VARCHAR(512) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
	FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);
INSERT INTO pessoas_usuarias (nome_pessoa_usuaria, idade, plano_id, data_assinatura) VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2018-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ( 'Jorge Amado', 58, 3, '2017-02-17');

	CREATE TABLE artistas 
(
    artista_id	INT AUTO_INCREMENT PRIMARY KEY,
    artista	VARCHAR(512) NOT NULL
);

INSERT INTO artistas (artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE albuns 
(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(512) NOT NULL,
    artista_id	INT NOT NULL,
    ano_lancamento YEAR NOT NULL,
	FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

INSERT INTO albuns (album, artista_id, ano_lancamento) VALUES
	('Renaissance', 1, '2022'),
	('Jazz', 2, '1978'),
	('Hot Space', 2, '1982'),
	('Falso Brilhante', 3, '1998'),
	('Vento de Maio', 3, '2001'),
	('QVVJFA?', 4, '2003'),
	('Somewhere Far Beyond', 5, '2007'),
	('I Put A Spell On You', 6, '2012');

	CREATE TABLE musicas 
(
    musica_id INT AUTO_INCREMENT PRIMARY KEY,
    musica VARCHAR(512) NOT NULL,
    album_id INT NOT NULL,
    artista_id	INT NOT NULL,
    duracao	INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES albuns (album_id),
	FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

INSERT INTO musicas (musica, album_id, artista_id, duracao) VALUES
	('BREAK MY SOUL', 1, 1, 279),
	("VIRGO'S GROOVE", 1, 1, 369),
	('ALIEN SUPERSTAR', 1, 1, 116),
	("Don't Stop Me Now", 2, 2, 203),
	('Under Pressure', 3, 2, 152),
	('Como Nossos Pais', 4, 3, 105),
	('O Medo de Amar é o Medo de Ser Livre', 5, 3, 207),
	('Samba em Paris', 6, 4, 267),
	("The Bard's Song", 7, 5, 244),
	('Feeling Good', 8, 6, 100);

	CREATE TABLE historico 
(
    pessoa_usuaria_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_reproducao	DATETIME NOT NULL,
	FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias (pessoa_usuaria_id),
	FOREIGN KEY (musica_id) REFERENCES musicas (musica_id),
	CONSTRAINT PRIMARY KEY(pessoa_usuaria_id, musica_id)
);

INSERT INTO historico (pessoa_usuaria_id, musica_id, data_reproducao) VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');

	CREATE TABLE seguidores 
(
    pessoa_usuaria_id INT NOT NULL,
    seguindo_artista INT NOT NULL,
	FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoas_usuarias (pessoa_usuaria_id),
	FOREIGN KEY (seguindo_artista) REFERENCES artistas (artista_id),
	CONSTRAINT PRIMARY KEY(pessoa_usuaria_id, seguindo_artista)
);

INSERT INTO seguidores (pessoa_usuaria_id, seguindo_artista) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);
