package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Author;
import org.project.OnlineBookStore.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
public class AuthorService {
    private final AuthorRepository authorRepository;

    @Autowired
    public AuthorService(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }

    public void saveAuthor(final Author author) {
        authorRepository.save(author);
    }

    public List<Author> findAll() {
        return authorRepository.findAll();
    }

    public Optional<Author> getAuthorById(final Long id) {
        return authorRepository.findById(id);
    }

    public Author update(Long authorId, Author author) {
        final var toUpdate = authorRepository.findById(authorId);
        final var existingAuthor = toUpdate.get();

        if (StringUtils.hasText(author.getName())) {
            existingAuthor.setName(author.getName());
        }
        if (StringUtils.hasText(author.getSurname())) {
            existingAuthor.setSurname(author.getSurname());
        }
        return authorRepository.save(existingAuthor);
    }

    public void deleteAuthor(final Author author) {
        authorRepository.delete(author);
    }

    public void deleteAuthor(final Long id) {
        authorRepository.deleteById(id);
    }

}
