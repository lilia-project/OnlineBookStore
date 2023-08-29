package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Author;
import org.project.OnlineBookStore.exception.ResourceNotFoundException;
import org.project.OnlineBookStore.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuthorService {
    private final AuthorRepository authorRepository;

    @PreAuthorize("hasAuthority('ADMIN')")
    public void saveAuthor(final Author author) {
        authorRepository.save(author);
    }

    public List<Author> findAll() {
        return authorRepository.findAll();
    }

    public Optional<Author> getAuthorById(final Long id) {
        return authorRepository.findById(id);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    public Author update(Long authorId, Author author) {
        final var toUpdate = authorRepository.findById(authorId).orElseThrow();

        toUpdate.setName(author.getName());
        toUpdate.setSurname(author.getSurname());

        return authorRepository.save(toUpdate);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    public void deleteAuthor(final Long id) {
        authorRepository.deleteById(id);
    }

    public Author findById(Long id) {
        return authorRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Author by id " + id + " was not found"));
    }
}
