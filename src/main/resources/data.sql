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
            (10, 'Andrey', 'Platonov'),
            (11, 'Mary', 'Shelley'),
            (12, 'Wilkie', 'Collins');

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
            (6, 3, 1),
            (7, 39, 7),
            (8, 87, 10),
            (9, 87, 7),
            (10, 54, 9),
            (11, 55, 7),
            (12, 65, 9),
            (13, 39, 6),
            (14, 58, 7),
            (15, 63, 9),
            (16, 82, 10),
            (17, 38, 4),
            (18, 87, 6),
            (19, 54, 6),
            (20, 35, 8),
            (21, 0, 0),
            (22, 68, 6),
            (23, 98, 8),
            (24, 73, 6),
            (25, 125, 25);

INSERT INTO public.book(id, name, price, stock, category_id, rating_id)
    VALUES (1, 'Lolita', 110, 6, 1, 5),
            (2, 'The Old Man and the Sea ', 130, 87, 1, 2),
            (3, '1984', 107, 12, 3, 3),
            (4, 'Gone with the Wind', 170, 63, 6, 4),
            (5, 'Pride and Prejudice', 160, 2, 4, 7),
            (6, 'The Divine Comedy', 126, 5, 4, 1),
            (7, 'The Story of Doctor Dolittle', 260, 34, 12, 7),
            (8, 'The Red House Mystery', 180, 36, 11, 10),
            (9, 'The Secret Garden', 276, 33, 5, 7),
            (10, 'Treasure Island', 173, 32, 3, 9),
            (11, 'Black Beauty', 345, 4, 3, 7),
            (12, 'My Man Jeeves', 78, 44, 3, 9),
            (13, 'Wuthering Heights', 109, 36, 3, 6),
            (14, 'The Adventures of Robin Hood', 153, 35, 3, 7),
            (15, 'The Red Badge of Courage', 322, 55, 8, 9),
            (16, 'The Picture of Dorian Gray', 177, 7, 4, 10),
            (17, 'The Count of Monte Cristo', 244, 7, 5, 4),
            (18, 'The Adventures of Tom Sawyer', 123, 55, 4, 6),
            (19, 'The Invisible Man', 135, 88, 7, 6),
            (20, 'Emma', 174, 44, 5, 8),
            (21, 'Tarzan of the Apes', 132, 44, 5, 21),
            (22, 'The Innocence of Father Brown', 760, 87, 7, 6),
            (23, 'Frankenstein', 166, 7, 8, 8),
            (24, 'The Moonstone', 288, 7, 10, 6),
            (25, 'Dracula', 145, 3, 8, 25);

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
	VALUES (1, 'user@gmail.com', '$2a$08$/Q0KaW3q.nwiA0QGSSJgoO.D/egxyoSFjHnvEI3focPBqp7AuecXm', 'user'),
	        (2, 'admin@gmail.com', '$2a$08$CnrPwKE5CK2RUSlTUesbMu81gx2Gm1q4FWDqPxAYwVmqJDf2WiKf6', 'admin');

insert into public.user_role(user_id, roles)
	VALUES (1, 'USER'),
	        (2, 'ADMIN');

insert into public.wishlist(id, user_id)
    VALUES (1, 1),
            (2, 2);

insert into public.basket(id, total, user_id)
 VALUES (1, 0, 1),
         (2, 0, 2);

select setval('hibernate_sequence', 150);
