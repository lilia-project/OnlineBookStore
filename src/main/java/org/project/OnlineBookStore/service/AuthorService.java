package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Author;
import org.project.OnlineBookStore.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AuthorService {
    private AuthorRepository authorRepository;

    @Autowired
    public AuthorService(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }
    public void saveAuthor(final Author author) {
        authorRepository.save(author);
    }

    public List<Author> getAuthors() {
        return authorRepository.findAll();
    }

    public Optional<Author> getAuthorById(final Long id) {
        return authorRepository.findById(id);
    }

    public void deleteAuthor(final Author author) {
        authorRepository.delete(author);
    }

}
