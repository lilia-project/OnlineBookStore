package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Comment;
import org.project.OnlineBookStore.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {
    private final CommentRepository commentRepository;

    @Autowired
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public void saveComment(final Comment comment) {
        commentRepository.save(comment);
    }

    public List<Comment> getComments() {
        return commentRepository.findAll();
    }

    public Optional<Comment> getCommentById(final Long id) {
        return commentRepository.findById(id);
    }

    public void deleteComment(final Comment comment) {
        commentRepository.delete(comment);
    }
}
