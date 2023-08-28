package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.dto.BookFiltersDto;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.util.Comparator;
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

    @PreAuthorize("hasAuthority('ADMIN')")
    public void saveBook(final Book book) {
        bookRepository.save(book);
    }

    /**
     * Filters books that satisfy all criteria received as bookFiltersDto
     *
     * @param bookFiltersDto  contain filter parameters as fields
     * @return  a page of books that satisfy all criteria
     */
    public List<Book> findAll(BookFiltersDto bookFiltersDto) {
        Comparator<Book> priceComparator = Comparator.comparing(Book::getPrice);
        Comparator<Book> fakeComparator = (book1, book2) -> 0;
        String bookSort = bookFiltersDto.getBookSort();

        Comparator<Book> currentComparator = switch ( bookSort == null? "":bookSort) {
            case "price" -> priceComparator;
            default -> fakeComparator;
        };

        return bookRepository.findAll().stream()
                .filter(book -> {
                    Long bookAuthorId = bookFiltersDto.getBookAuthorId();
                    if (bookAuthorId != null) {
                        return book.getAuthors().stream()
                                .anyMatch(author -> author.getId().equals(bookAuthorId));
                    }
                    return true;
                })
                .filter(book -> {
                    String bookTitle = bookFiltersDto.getBookTitle();
                    if (bookTitle != null && !bookTitle.equals("")) {
                        bookTitle = bookTitle.toLowerCase();
                        return book.getName().toLowerCase().contains(bookTitle);
                    }
                    return true;
                })
                .filter(book -> {
                    Long categoryId = bookFiltersDto.getBookCategoryId();
                    if (categoryId != null) {
                        return book.getCategory().getId().equals(categoryId);
                    }
                    return true;
                })
                .sorted(currentComparator)
                .toList();
    }

    public Optional<Book> getBookById(final Long id) {
        return bookRepository.findById(id);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    public Book update(Long bookId, Book book) {
        final var toUpdate = bookRepository.findById(bookId).orElseThrow();

        toUpdate.setName(book.getName());
        toUpdate.setPrice(book.getPrice());
        toUpdate.setStock(book.getStock());

        return bookRepository.save(toUpdate);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
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
