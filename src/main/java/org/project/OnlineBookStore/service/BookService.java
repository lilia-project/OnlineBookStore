package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    private final BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void saveBook(final Book book) {
        bookRepository.save(book);
    }

    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    public Optional<Book> getBookById(final Long id) {
        return bookRepository.findById(id);
    }

    //    @PreAuthorize("hasRole('ADMIN')")
    public Book update(Long bookId, Book book) {
        final var toUpdate = bookRepository.findById(bookId);

//        if (toUpdate.isEmpty()) {
//            log.warn("Could not find a course by id {}", courseId);
//            throw new ResourceNotFoundException(courseId, "Could not find a course with id {}");
//        }

        final var existingBook = toUpdate.get();

        if (StringUtils.hasText(book.getName())) {
            existingBook.setName(book.getName());
        }

        Book updated = bookRepository.save(existingBook);

//        log.info("Updated course: {}", updated);

        return updated;
    }

    public void deleteBook(final Long id) {
        bookRepository.deleteById(id);
    }

    public void deleteBook(final Book book) {
        bookRepository.delete(book);
    }


}
