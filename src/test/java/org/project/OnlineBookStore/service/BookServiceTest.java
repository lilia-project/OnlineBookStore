package org.project.OnlineBookStore.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.project.OnlineBookStore.dto.BookFiltersDto;
import org.project.OnlineBookStore.entity.Author;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.Category;
import org.project.OnlineBookStore.entity.Rating;
import org.project.OnlineBookStore.repository.BookRepository;

import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class BookServiceTest {

    @Mock
    private BookRepository bookRepository;

    @InjectMocks
    private BookService target;

    private List<Book> books;

    @BeforeEach
    void init() {
        Author hemingway = createAuthor(1L, "Ernest", "Hemingway");
        Author orwell = createAuthor(2L, "George", "Orwell");
        Author camus = createAuthor(3L, "Albert", "Camus");
        Author salinger = createAuthor(4L, "Jerome", "Salinger");

        Category fiction = createCategory(1L, "Fiction");
        Category science = createCategory(2L, "Science");
        Category adventure = createCategory(3L, "Adventure");

        Rating book1Rating = createRating(1L, 50L, 10L); // 5.0
        Rating book2Rating = createRating(2L, 40L, 9L); // 4.44
        Rating book3Rating = createRating(3L, 35L, 8L); // 4.37
        Rating book4Rating = createRating(4L, 63L, 13L); // 4.8
        Rating book5Rating = createRating(5L, 55L, 15L); // 3.66
        Rating book6Rating = createRating(6L, 32L, 17L); // 1.9

        Book book1 = createBook(1L, "Lolita", 100L, 6L, fiction, Set.of(hemingway, orwell), book1Rating);
        Book book2 = createBook(2L, "The Old Man and the Sea", 80L, 2L, fiction, Set.of(camus), book2Rating);
        Book book3 = createBook(3L, "1984", 75L, 1L, science, Set.of(salinger), book3Rating);
        Book book4 = createBook(4L, "Gone with the Wind", 85L, 0L, adventure, Set.of(orwell, salinger), book4Rating);
        Book book5 = createBook(5L, "Pride and Prejudice", 25L, 16L, adventure, Set.of(salinger), book5Rating);
        Book book6 = createBook(6L, "The Divine Comedy", 90L, 22L, adventure, Set.of(hemingway), book6Rating);

        books = List.of(book1, book2, book3, book4, book5, book6);
    }

    @Test
    void shouldGetPagesOfBooksByNameAndSortByPrice() {
        // Given
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookTitle("and");
        bookFiltersDto.setBookSort("price");
        bookFiltersDto.setPage(1L);
        bookFiltersDto.setPageSize(1L);

        when(bookRepository.findAll()).thenReturn(books);

        // When
        List<Book> result = target.findAll(bookFiltersDto);

        // Then
        verify(bookRepository).findAll();
        assertEquals(1, result.size());
        assertEquals("Pride and Prejudice", result.get(0).getName());
        assertEquals(25L, result.get(0).getPrice());

        // When
        bookFiltersDto.setPage(2L);
        result = target.findAll(bookFiltersDto);

        // Then
        assertEquals(1, result.size());
        assertEquals("The Old Man and the Sea", result.get(0).getName());
        assertEquals(80L, result.get(0).getPrice());
    }

    @Test
    void shouldGetPagesOfBooksByCategory() {
        // Given
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookCategoryId(2L);
        bookFiltersDto.setPage(1L);
        bookFiltersDto.setPageSize(2L);

        when(bookRepository.findAll()).thenReturn(books);

        // When
        List<Book> result = target.findAll(bookFiltersDto);

        // Then
        verify(bookRepository).findAll();
        assertEquals(1, result.size());
        assertEquals("1984", result.get(0).getName());
        assertEquals(75L, result.get(0).getPrice());
    }

    @Test
    void shouldGetPageOfBooksByCategoryAndAuthor() {
        // Given
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookCategoryId(1L);
        bookFiltersDto.setBookAuthorId(2L);
        bookFiltersDto.setPage(1L);
        bookFiltersDto.setPageSize(2L);

        when(bookRepository.findAll()).thenReturn(books);

        // When
        List<Book> result = target.findAll(bookFiltersDto);

        // Then
        verify(bookRepository).findAll();
        assertEquals(1, result.size());
        assertEquals("Lolita", result.get(0).getName());
        assertEquals(100L, result.get(0).getPrice());
    }

    @Test
    void shouldGetPageOfBooksWithoutSorting() {
        // Given
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookSort("");
        bookFiltersDto.setPage(1L);
        bookFiltersDto.setPageSize(6L);

        when(bookRepository.findAll()).thenReturn(books);

        // When
        List<Book> result = target.findAll(bookFiltersDto);

        // Then
        verify(bookRepository).findAll();
        assertEquals(6, result.size());
        assertEquals(books, result);
    }

    @Test
    @Disabled
    void shouldGetPageOfBooksSortedByAvailability() {
        // Given
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookSort("available");
        bookFiltersDto.setPage(1L);
        bookFiltersDto.setPageSize(6L);

        when(bookRepository.findAll()).thenReturn(books);

        // When
        List<Book> result = target.findAll(bookFiltersDto);

        // Then
        verify(bookRepository).findAll();
        assertEquals(6, result.size());
        assertEquals("Gone with the Wind", result.get(5).getName());
        assertEquals(85L, result.get(5).getPrice());
        assertEquals(4L, result.get(5).getId());
    }

    @Test
    @Disabled
    void shouldGetPageOfBooksSortedByRating() {
        // Given
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookSort("rating");
        bookFiltersDto.setPage(1L);
        bookFiltersDto.setPageSize(6L);

        when(bookRepository.findAll()).thenReturn(books);

        // When
        List<Book> result = target.findAll(bookFiltersDto);

        // Then
        verify(bookRepository).findAll();
        assertEquals(6, result.size());
        assertEquals("", result.get(0).getName());
        assertEquals(85L, result.get(0).getPrice());
        assertEquals(4L, result.get(0).getId());
    }

    private Author createAuthor(long id, String name, String surname) {
        Author author = new Author();
        author.setId(id);
        author.setName(name);
        author.setSurname(surname);
        return author;
    }

    private Category createCategory(Long id, String name) {
        Category category = new Category();
        category.setId(id);
        category.setName(name);
        return category;
    }

    private Rating createRating(Long id, Long gradesSum, Long commentCounter) {
        Rating rating = new Rating();
        rating.setId(id);
        rating.setGradesSum(gradesSum);
        rating.setCommentCounter(commentCounter);
        return rating;
    }

    private Book createBook(Long id, String name, Long price, Long stock, Category category, Set<Author> authors, Rating rating) {
        Book book = new Book();
        book.setId(id);
        book.setName(name);
        book.setPrice(price);
        book.setStock(stock);
        book.setCategory(category);
        book.setAuthors(authors);
        book.setRating(rating);
        return book;
    }

}