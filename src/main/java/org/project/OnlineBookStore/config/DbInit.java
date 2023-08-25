package org.project.OnlineBookStore.config;

import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.service.AuthorService;
import org.project.OnlineBookStore.service.BookService;
import org.project.OnlineBookStore.service.UserService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Random;

@Component
public class DbInit {
    private final BookService bookService;
    private final UserService userService;
    private Random random = new Random();

    public DbInit(BookService bookService, UserService userService) {
        this.bookService = bookService;
        this.userService = userService;
    }

    @PostConstruct
    private void postConstructBook() {
        for (int i = 0; i < 10; i++) {
            final Book book = new Book();
            book.setName("Book_" + (int) (Math.random() * 401));
//            Set<Author> authorsSet = new HashSet<>(authorService.getAuthors());
//            book.setAuthors(authorsSet);
            book.setPrice((long) (Math.random() * 501));
            book.setStock((long) (Math.random() * 101));

            bookService.saveBook(book);
        }
//        final User user = new User();
//        user.setEmail("user@gmail.com");
//        user.setUsername("cat");
//        user.setPassword("cat");
//
//        userService.addUser(user, false);
//
//        final User admin = new User();
//        admin.setEmail("admin@gmail.com");
//        admin.setUsername("admin");
//        admin.setPassword("admin");
//
//        userService.addUser(admin, true);

    }

}

