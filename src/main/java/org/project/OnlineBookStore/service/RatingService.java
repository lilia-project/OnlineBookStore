package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Category;
import org.project.OnlineBookStore.entity.Rating;
import org.project.OnlineBookStore.repository.RatingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RatingService {
    private RatingRepository ratingRepository;

    @Autowired
    public RatingService(RatingRepository ratingRepository) {
        this.ratingRepository = ratingRepository;
    }
    public void saveRating(final Rating rating) {
        ratingRepository.save(rating);
    }

    public List<Rating> getRating() {
        return ratingRepository.findAll();
    }

    public Optional<Rating> getRatingById(final Long id) {
        return ratingRepository.findById(id);
    }

    public void deleteRating(final Rating rating) {
        ratingRepository.delete(rating);
    }
}
