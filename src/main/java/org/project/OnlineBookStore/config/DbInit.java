package org.project.OnlineBookStore.config;

import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.service.AuthorService;
import org.project.OnlineBookStore.service.BookService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Random;

@Component
public class DbInit {
    private final BookService bookService;
    private final AuthorService authorService;
    private Random random = new Random();

    public DbInit(BookService bookService, AuthorService authorService) {
        this.bookService = bookService;
        this.authorService = authorService;
    }

    @PostConstruct
    private void postConstruct() {
        for (int i = 0; i < 10; i++) {
            final Book book = new Book();
            book.setName("Book_" + (int) (Math.random() * 401));
//            Set<Author> authorsSet = new HashSet<>(authorService.getAuthors());
//            book.setAuthors(authorsSet);
            book.setPrice((long) (Math.random() * 501));
            book.setStock((long) (Math.random() * 101));

            bookService.saveBook(book);
        }
    }
}
