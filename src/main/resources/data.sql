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

INSERT INTO public.rating (id, grades_sum, comment_counter)
    VALUES (1, 54, 8),
            (2, 65, 7),
            (3, 17, 2),
            (4, 85, 12),
            (5, 45, 7),
            (6, 3, 1);

INSERT INTO public.book(id, name, price, stock, category_id, rating_id)
    VALUES (1, 'Lolita', 100, 6, 1, 5),
            (2, 'The Old Man and the Sea ', 100, 6, 1, 2),
            (3, '1984', 10, 3, 3, 3),
            (4, 'Gone with the Wind', 170, 63, 6, 4),
            (5, 'Pride and Prejudice', 760, 2, 4, 1),
            (6, 'The Divine Comedy', 76, 5, 4, 6);

INSERT INTO public.author_book (book_id, author_id)
    VALUES (1, 2),
            (1, 3),
            (2, 4),
            (3, 5),
            (4, 6),
            (5, 1),
            (6, 4),
            (4, 1);

insert into public.consumer(id, email, password, username)
	VALUES (1, 'u@gmail.com', '$2a$08$Lw3Q5M7a/zcB23hxLHoGbuEOKbC/..czeObjaBc3l71XR54XAUdT.', 'u'),
	        (2, 'admin@gmail.com', '$2a$08$Lw3Q5M7a/zcB23hxLHoGbuEOKbC/..czeObjaBc3l71XR54XAUdT.', 'a');

insert into public.user_role(user_id, roles)
	VALUES (1, 'USER'),
	         (2, 'ADMIN');

select setval((select pg_get_serial_sequence('public.author', 'id')), (select max(id) from public.author));
select setval((select pg_get_serial_sequence('public.category', 'id')), (select max(id) from public.category));
select setval((select pg_get_serial_sequence('public.book', 'id')), (select max(id) from public.book));
select setval((select pg_get_serial_sequence('public.basket', 'id')), (select max(id) from public.basket));
select setval((select pg_get_serial_sequence('public.consumer', 'id')), (select max(id) from public.consumer));
select setval((select pg_get_serial_sequence('public.rating', 'id')), (select max(id) from public.rating));
