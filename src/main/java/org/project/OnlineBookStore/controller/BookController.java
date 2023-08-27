package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.dto.BookFiltersDto;
import org.project.OnlineBookStore.dto.CreateBookDto;
import org.project.OnlineBookStore.entity.Author;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.Category;
import org.project.OnlineBookStore.service.AuthorService;
import org.project.OnlineBookStore.service.BookService;
import org.project.OnlineBookStore.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "/books")
public class BookController {
    private final BookService bookService;
    private final CategoryService categoryService;
    private final AuthorService authorService;

    @GetMapping("/create-book-page")
    public String createBookForm(Model model) {
        List<Category> categories = categoryService.findAll();
        List<Author> authors = authorService.findAll();

        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors);
        return "book/book-create";
    }

    /**
     * Creates new book in the database.
     *
     * @param bookDto  new book
     * @return  the page of books
     */
    @PostMapping
    public String createNewBook(@RequestBody @Valid CreateBookDto bookDto) {
        Book book = new Book();
        book.setName(bookDto.getName());
        book.setStock(bookDto.getStock());
        book.setPrice(bookDto.getPrice());
        book.setCategory(categoryService.findById(bookDto.getCategory()));
        book.setAuthors(Set.of(authorService.findById(bookDto.getAuthor())));
        bookService.saveBook(book);
        return "redirect:/books";
    }

    /**
     * Returns a page of books that satisfy all criteria passed as request params.
     *
     * @param model  will be auto-injected by Spring
     * @param page  the page number, default - 1
     * @param pageSize  the number of items on the page, default 5
     * @param authorId  the author id
     * @param categoryId the category id
     * @param bookTitle the book name
     * @param bookSort  the sort option, one of rating, available, price
     * @return  the page of books
     */
    @GetMapping
    public String getAllBooks(Model model,
                              @RequestParam(required = false, defaultValue = "1") Long page,
                              @RequestParam(required = false, defaultValue = "5") Long pageSize,
                              @RequestParam(required = false)Long authorId,
                              @RequestParam(required = false) Long categoryId,
                              @RequestParam(required = false) String bookTitle,
                              @RequestParam(required = false) String bookSort) {
        BookFiltersDto bookFiltersDto = new BookFiltersDto();
        bookFiltersDto.setBookAuthorId(authorId);
        bookFiltersDto.setBookCategoryId(categoryId);
        bookFiltersDto.setBookTitle(bookTitle);
        bookFiltersDto.setBookSort(bookSort);
        bookFiltersDto.setPageSize(pageSize);
        bookFiltersDto.setPage(page);

        final List<Book> books = bookService.findAll(bookFiltersDto);
        List<Category> categories = categoryService.findAll();
        List<Author> authors = authorService.findAll();
        model.addAttribute("books", books);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors);
        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        return "book/books";
    }

    /**
     * Returns a page of book by book id.
     *
     * @param model  will be auto-injected by Spring
     * @param id  the book id
     * @return  the page of book
     */
    @GetMapping("/{id}") //получить по id
    public String getBookById(Model model, @PathVariable Long id) {
        final Optional<Book> bookById = bookService.getBookById(id);
        final Book book = bookById.orElse(null);
        model.addAttribute("book", book);
        model.addAttribute("id", id);
        return "book/book";
    }

    /**
     * Returns a page by book id for edit book.
     *
     * @param bookId the book id
     * @param model  will be auto-injected by Spring
     * @return  the page for edit book
     */
    @GetMapping("/{bookId}/edit-book-page")
    public String editBookPage(@PathVariable Long bookId, Model model) {
        Optional<Book> book = bookService.getBookById(bookId);
        model.addAttribute("book", book.get());

        return "book/book-edit";
    }

    /**
     * Updates the book in the database
     *
     * @param book  the book with new parameters
     * @param bookId  the book id
     * @return  a page with updated book
     */
    @PutMapping("/{bookId}")
    @ResponseBody
    public Book update(@RequestBody @Valid Book book, @PathVariable Long bookId) {
        return bookService.update(bookId, book);
    }

    /**
     * Deletes the book by book id
     *
     * @param id the book id
     */
    @DeleteMapping("/{id}")
    @ResponseBody
    public void delete(@PathVariable Long id) {
        bookService.deleteBook(id);
    }


}
