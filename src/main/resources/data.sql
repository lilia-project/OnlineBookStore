insert into public.author(id, name, surname)
	VALUES (1, 'Владимир', 'Набоков'),
	        (2, 'Эрнест', 'Хемингуэй'),
	        (3, 'Джордж', 'Оруэлл'),
	        (4, 'Михаил', 'Шолохов'),
	        (5, 'Альбер', 'Камю'),
	        (6, 'Джером', 'Сэлинджер'),
	        (7, 'Андрей', 'Платонов');

INSERT INTO public.category(id, name)
	VALUES (1, 'Детективы и триллеры'),
	        (2, 'Романы'),
	        (3, 'Приключения'),
	        (4, 'Драма'),
	        (5, 'Классическая литература'),
	        (6, 'Наука'),
	        (7, 'Психология и саморазвитие'),
	        (8, 'Мистика и ужасы'),
	        (9, 'Искусство и музыка'),
	        (10, 'Спорт и фитнес'),
	        (11, 'Кулинария'),
	        (12, 'Комиксы'),
	        (13, 'Религия и духовность');

select setval((select pg_get_serial_sequence('public.author', 'id')), (select max(id) from public.author));
select setval((select pg_get_serial_sequence('public.category', 'id')), (select max(id) from public.category));
