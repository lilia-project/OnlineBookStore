package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class BookService {
    private final BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
    @PreAuthorize("hasRole('ADMIN')")
    public void saveBook(final Book book) {
        bookRepository.save(book);
    }

    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    public Optional<Book> getBookById(final Long id) {
        return bookRepository.findById(id);
    }

    @PreAuthorize("hasRole('ADMIN')")
    public Book update(Long bookId, Book book) {
        final var toUpdate = bookRepository.findById(bookId).orElseThrow();

        toUpdate.setName(book.getName());
        toUpdate.setPrice(book.getPrice());
        toUpdate.setStock(book.getStock());

        return bookRepository.save(toUpdate);
//        log.info("Updated book: {}", updated);
    }
    @PreAuthorize("hasRole('ADMIN')")
    public void deleteBook(final Long id) {
        bookRepository.deleteById(id);
    }

    public Set<Book> findAll(Long categoryId) {
        return bookRepository.findAllByCategoryId(categoryId);

    }

    public List<Book> getAllByIds(Set<Long> bookIds) {
        return bookRepository.findAllById(bookIds);
    }
}
