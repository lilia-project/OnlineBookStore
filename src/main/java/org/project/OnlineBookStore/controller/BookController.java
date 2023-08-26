package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.dto.BookFiltersDto;
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

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "/books")
public class BookController {
    private final BookService bookService;
    private final CategoryService categoryService;
    private final AuthorService authorService;

    @GetMapping("/create-book-page") //вызвать форму для создания нового экземпляра
    public String createBookForm() {
        return "book/book-create";
    }

    @PostMapping//создать новый экземпляр в БД
    public String createNewBook(@RequestBody Book book) {
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
    @GetMapping //получить все
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

    @GetMapping("/{id}") //получить по id
    public String getBookById(Model model, @PathVariable Long id) {
        final Optional<Book> bookById = bookService.getBookById(id);
        final Book book = bookById.orElse(null);
        model.addAttribute("book", book);
        model.addAttribute("id", id);
        return "book/book";
    }

    @GetMapping("/{bookId}/edit-book-page") //вызвать форму для правки экземпляра
    public String editBookPage(@PathVariable Long bookId, Model model) {
        Optional<Book> book = bookService.getBookById(bookId);
        model.addAttribute("book", book.get());

        return "book/book-edit";
    }

    @PutMapping("/{bookId}") //обновить
    @ResponseBody
    public Book update(@RequestBody @Valid Book book, @PathVariable Long bookId) {
        return bookService.update(bookId, book);
    }

    @DeleteMapping("/{id}") //удалить по id
    @ResponseBody
    public void delete(@PathVariable Long id) {
        bookService.deleteBook(id);
    }


}
