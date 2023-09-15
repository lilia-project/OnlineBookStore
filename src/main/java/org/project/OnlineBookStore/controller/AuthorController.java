package org.project.OnlineBookStore.controller;

import org.project.OnlineBookStore.entity.Author;
import org.project.OnlineBookStore.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/authors")
public class AuthorController {
    private final AuthorService authorService;

    @Autowired
    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping("/create-author-page")
    public String createAuthorForm() {
        return "author/author-create";
    }

    @PostMapping
    public String createNewAuthor(@RequestBody Author author) {
        authorService.saveAuthor(author);
        return "redirect:/authors";
    }


    @GetMapping
    public String getAllAuthors(Model model) {
        final List<Author> authors = authorService.findAll();
        model.addAttribute("authors", authors);
        return "author/authors";
    }

    @GetMapping("/{id}")
    public String getAuthorById(Model model, @PathVariable Long id) {
        final Optional<Author> authorById = authorService.getAuthorById(id);
        final Author author = authorById.orElse(null);
        model.addAttribute("author", author);
        model.addAttribute("id", id);
        return "author/author";
    }

    @GetMapping("/{authorId}/edit-author-page")
    public String editAuthorPage(@PathVariable Long authorId, Model model) {
        Optional<Author> author = authorService.getAuthorById(authorId);
        model.addAttribute("author", author.get());

        return "author/author-edit";
    }

    @PutMapping("/{authorId}")
    @ResponseBody
    public Author update(@RequestBody @Valid Author author, @PathVariable Long authorId) {
        return authorService.update(authorId, author);
    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public void delete(@PathVariable Long id) {
        authorService.deleteAuthor(id);
    }

}
