insert into public.author(id, name, surname)
	VALUES (1, 'Vladimir', 'Nabokov'),
            (2, 'Ernest', 'Hemingway'),
            (3, 'George', 'Orwell'),
            (4, 'Mikhail', 'Sholokhov'),
            (5, 'Albert', 'Camus'),
            (6, 'Jerome', 'Salinger'),
            (7, 'Andrey', 'Platonov');

insert into public.category(id, name)
	VALUES (1, 'Detectives and thrillers'),
            (2, 'Romance'),
            (3, 'Adventure'),
            (4, 'Fantasy'),
            (5, 'Classical Literature'),
            (6, 'Science'),
            (7, 'Psychology and self-development'),
            (8, 'Mystery and Thrillers'),
            (9, 'Art and Music'),
            (10, 'Sports and fitness'),
            (11, 'Cooking'),
            (12, 'Comics'),
            (13, 'Religion and Spirituality');

select setval((select pg_get_serial_sequence('public.author', 'id')), (select max(id) from public.author));
select setval((select pg_get_serial_sequence('public.category', 'id')), (select max(id) from public.category));
