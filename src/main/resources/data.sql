insert into public.author(id, name, surname)
	VALUES (1, 'Vladimir', 'Nabokov'),
            (2, 'Ernest', 'Hemingway'),
            (3, 'George', 'Orwell'),
            (4, 'Mikhail', 'Sholokhov'),
            (5, 'Albert', 'Camus'),
            (6, 'Jerome', 'Salinger'),
            (7, 'Dante', 'Alighieri'),
            (8, 'Margaret', 'Mitchell'),
            (9, 'Jane', 'Austen'),
            (10, 'Andrey', 'Platonov');

/*INSERT INTO public.book(id, name, price, stock, category_id, rating_id)
	VALUES (1, 'Lolita', 100, 6, 1, 0),
	        (2, 'The Old Man and the Sea ', 100, 6, 1, 0),
	        (3, '1984', 10, 3, 3, 0),
	        (4, 'Gone with the Wind', 170, 63, 6, 0),
	        (5, 'Pride and Prejudice', 760, 2, 4, 0),
	        (6, 'The Divine Comedy', 76, 5, 4, 0);*/

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
select setval((select pg_get_serial_sequence('public.book', 'id')), (select max(id) from public.book));
