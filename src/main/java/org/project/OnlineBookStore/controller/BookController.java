package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.Category;
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

    @GetMapping("/create-book-page") //вызвать форму для создания нового экземпляра
    public String createBookForm() {
        return "book/book-create";
    }

    @PostMapping//создать новый экземпляр в БД
    public String createNewBook(@RequestBody Book book) {
        bookService.saveBook(book);
        return "redirect:/books";
    }

    @GetMapping //получить все
    public String getAllBooks(Model model) {
        final List<Book> books = bookService.findAll();
        List<Category> categories = categoryService.findAll();
        model.addAttribute("books", books);
        model.addAttribute("categories", categories);
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

    @GetMapping("/filter") //вызвать форму для правки экземпляра
    public String filterBook(@RequestParam Long categoryId, Model model) {
        Set<Book> books = bookService.findAll(categoryId);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("books", books);
        model.addAttribute("categories", categories);

        return "book/books";
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
