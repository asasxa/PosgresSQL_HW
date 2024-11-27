-- Группы
INSERT INTO performers(name) VALUES
('Ария'),
('Оззи Осборн'),
('Король и Шут'),
('Linkin Park')
ON CONFLICT (name) DO NOTHING; 

-- Жанры
INSERT INTO genres (name) VALUES 
('хеви-метал'),
('хард-рок'),
('глэм-метал'),
('дум-метал'),
('хоррор-панк'),
('фолк-панк'),
('панк-рок'),
('альтернативный рок'),
('рэп-рок'),
('Ню-метал'),
('Альтернативный метал'),
('Электроник-рок'),
('Рэп-метал'),
('Поп-рок'),
('Поп-музыка')
ON CONFLICT (name) DO NOTHING;

-- Альбомы
INSERT INTO albums (title, release_date) VALUES 
('Герой асфальта', '1987-09-01'),
('Игра с огнём', '1989-03-01'),
('Химера', '2001-04-12'),
('No More Tears', '1991-09-17'),
('Blizzard of Ozz', '1980-09-20'),
('Bark at the Moon', '1983-12-10'),
('Камнем по голове', '1996-10-03'),
('Король и Шут', '1997-12-18'),
('Акустический альбом', '1998-01-01'),
('Hybrid Theory', '2000-10-24'),
('Meteora', '2003-03-25'),
('Minutes to Midnight', '2007-05-15'),
('Жаль, нет ружья', '2002-10-10'),
('Для задания', '2020-01-01')
ON CONFLICT (title) DO NOTHING;

-- Треки
INSERT INTO tracks (title, release_date, album_id, duration) VALUES 
('На службе силы зла', '1987-09-01', 1, '00:07:10'),
('Герой асфальта', '1987-09-01', 1, '00:05:11'),
('Мёртвая зона', '1987-09-01', 1, '00:06:43'),
('1100', '1987-09-01', 1, '00:04:55'),
('Что вы сделали с вашей мечтой?', '1989-03-01', 2, '00:05:22'),
('Раскачаем этот мир', '1989-03-01', 2, '00:06:01'),
('Раб страха', '1989-03-01', 2, '00:04:40'),
('Искушение', '1989-03-01', 2, '00:04:00'),
('Игра с огнём', '1989-03-01', 2, '00:09:04'),
('Химера', '2001-04-12', 3, '00:04:37'),
('Небо тебя найдёт', '2001-04-12', 3, '00:05:29'),
('Я не сошёл с ума', '2001-04-12', 3, '00:06:23'),
('Вампир', '2001-04-12', 3, '00:05:28'),
('Mr. Tinkertrain', '1980-09-20', 4, '00:05:57'),
('I Don''t Want to Change the World', '1980-09-20', 4, '00:04:06'),
('Mama, I’m Coming Home', '1980-09-20', 4, '00:04:12'),
('I Don’t Know', '1980-09-20', 5, '00:05:17'),
('Crazy Train', '1980-09-20', 5, '00:04:51'),
('Goodbye to Romance', '1980-09-20', 5, '00:05:36'),
('Bark at the Moon', '1983-12-10', 6, '00:04:17'),
('You’re No Different', '1983-12-10', 6, '00:05:02'),
('Now You See It (Now You Don’t)', '1983-12-10', 6, '00:05:06'),
('Смельчак и ветер', '1996-10-03', 7, '00:03:03'),
('Проказник скоморох', '1996-10-03', 7, '00:01:52'),
('Верная жена', '1996-10-03', 7, '00:02:37'),
('Садовник', '1996-10-03', 7, '00:03:42'),
('Король и Шут', '1997-12-18', 8, '00:02:42'),
('Два друга и разбойники', '1997-12-18', 8, '00:02:15'),
('Сапоги мертвеца', '1997-12-18', 8, '00:02:30'),
('Охотник', '1997-12-18', 8, '00:02:36'),
('Дед на свадьбе', '1998-01-01', 9, '00:04:46'),
('Запрет отца', '1998-01-01', 9, '00:03:31'),
('Кузнец', '1998-01-01', 9, '00:02:59'),
('Разговор с гоблином', '1998-01-01', 9, '00:02:32'),
('Papercut', '2000-10-24', 10, '00:03:05'),
('One Step Closer', '2000-10-24', 10, '00:02:27'),
('With You', '2000-10-24', 10, '00:03:23'),
('Points of Authority', '2000-10-24', 10, '00:03:20'),
('Foreword', '2003-03-25', 11, '00:00:13'),
('Don''t Stay', '2003-03-25', 11, '00:03:08'),
('Somewhere I Belong', '2003-03-25', 11, '00:03:34'),
('Lying from You', '2003-03-25', 11, '00:02:56'),
('Wake', '2007-05-15', 12, '00:01:41'),
('Given Up', '2007-05-15', 12, '00:03:09'),
('Leave Out All the Rest', '2007-05-15', 12, '00:03:29'),
('Bleed It Out', '2007-05-15', 12, '00:02:44'),
('мой характер', '2002-01-01 00:00:00.000', 13, '00:03:51')
ON CONFLICT (title, album_id) DO NOTHING;

-- Сборники
INSERT INTO collection (title, release_date) VALUES 
('Легенды русского рока', '1996-01-01'),
('Легенды русского рока - 2', '2003-01-01'),
('Ballads', '2022-01-01'),
('Best of Ozz', '1989-01-01'),
('The Ozzman Cometh', '1997-01-01'),
('Chef Aid: The South Park Album', '1998-01-01'),
('Собрание', '2001-03-01'),
('Энциклопедия русского рока', '2001-01-01'),
('Лучшие хиты', '2003-01-01'),
('Studio Collection', '2013-01-15'),
('Сборник для задания', '2019-01-02')
ON CONFLICT (title) DO NOTHING;

INSERT INTO performers_genres (performer_id, genre_id) VALUES 
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15);

INSERT INTO albums_performers (performer_id, album_id) VALUES 
(1, 1),  
(2, 1),  
(3, 1),  
(4, 2),  
(5, 2),  
(6, 2),  
(7, 3),  
(8, 3),  
(9, 3),  
(10, 3), 
(11, 4), 
(12, 4), 
(13, 4), 
(14, 1)  
ON CONFLICT (performer_id, album_id) DO NOTHING;

INSERT INTO collection_tracks (collection_id, track_id) VALUES 
(1, 1), 
(1, 2), 
(1, 3), 
(1, 4), 
(1, 5), 
(1, 6), 
(2, 7), 
(2, 8), 
(2, 9), 
(2, 10), 
(2, 11), 
(2, 12), 
(2, 13), 
(3, 14), 
(3, 15), 
(4, 16), 
(4, 17), 
(6, 19), 
(6, 20), 
(7, 23), 
(7, 24), 
(8, 29), 
(8, 28), 
(9, 29), 
(9, 34), 
(10, 44), 
(10, 45), 
(11, 20), 
(11, 18) 
ON CONFLICT (collection_id, track_id) DO NOTHING;