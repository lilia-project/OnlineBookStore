package org.project.OnlineBookStore.service;

import com.sun.source.tree.Tree;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    private BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
    public void saveTree(final Book book) {
        bookRepository.save(book);
    }

    public List<Book> getBooks() {
        return bookRepository.findAll();
    }

    public Optional<Book> getBookById(final Long id) {
        return bookRepository.findById(id);
    }

    public void deleteBook(final Book book) {
        bookRepository.delete(book);
    }
}
