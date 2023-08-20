insert into public.author(id, name, surname)
	VALUES (1,'Владимир', 'Набоков'),
	        (2,'Эрнест', 'Хемингуэй'),
	        (3,'Андрей', 'Платонов');

select setval((select pg_get_serial_sequence('public.author', 'id')), (select max(id) from public.author));
