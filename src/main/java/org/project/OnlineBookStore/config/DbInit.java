package org.project.OnlineBookStore.config;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.repository.BookRepository;
import org.project.OnlineBookStore.service.BookService;
import org.project.OnlineBookStore.service.UserService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Random;

@Component
@RequiredArgsConstructor
public class DbInit {
    private final BookService bookService;
    private final BookRepository bookRepository;
    private final UserService userService;
    private Random random = new Random();

    @PostConstruct
    private void postConstructBook() {
        for (int i = 0; i < 10; i++) {
            final Book book = new Book();
            book.setName("Book_" + (int) (Math.random() * 401));
//            Set<Author> authorsSet = new HashSet<>(authorService.getAuthors());
//            book.setAuthors(authorsSet);
            book.setPrice((long) (Math.random() * 501));
            book.setStock((long) (Math.random() * 101));

            bookRepository.save(book);
        }
        final User user = new User();
        user.setEmail("u@gmail.com");
        user.setUsername("u");
        user.setPassword("$2a$08$Lw3Q5M7a/zcB23hxLHoGbuEOKbC/..czeObjaBc3l71XR54XAUdT.");

        userService.addUser(user, false);

        /*final User admin = new User();
        admin.setEmail("admin@gmail.com");
        admin.setUsername("admin");
        admin.setPassword("admin");

        userService.addUser(admin, true);*/

    }

}

