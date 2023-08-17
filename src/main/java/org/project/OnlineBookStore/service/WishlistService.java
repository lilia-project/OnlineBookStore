package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Wishlist;
import org.project.OnlineBookStore.repository.WishlistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WishlistService {
    private final WishlistRepository wishlistRepository;

    @Autowired
    public WishlistService(WishlistRepository wishlistRepository) {
        this.wishlistRepository = wishlistRepository;
    }

    public void saveWishlist(final Wishlist wishlist) {
        wishlistRepository.save(wishlist);
    }

    public List<Wishlist> getWishlists() {
        return wishlistRepository.findAll();
    }

    public Optional<Wishlist> getWishlistById(final Long id) {
        return wishlistRepository.findById(id);
    }

    public void deleteWishlist(final Wishlist wishlist) {
        wishlistRepository.delete(wishlist);
    }
}
