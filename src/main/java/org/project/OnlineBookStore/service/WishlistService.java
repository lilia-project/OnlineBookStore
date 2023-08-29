package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.entity.Wishlist;
import org.project.OnlineBookStore.exception.ResourceNotFoundException;
import org.project.OnlineBookStore.repository.WishlistRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class WishlistService {
    private final WishlistRepository wishlistRepository;
    private final BookService bookService;

    public void saveWishlist(final Wishlist wishlist) {
        wishlistRepository.save(wishlist);
    }

    public Optional<Wishlist> findByUserId(Long userId) {
        return wishlistRepository.findByUserId(userId);
    }

    public Wishlist getRequiredByUserId(Long userId) {
        return findByUserId(userId)
                .orElseThrow(() -> new ResourceNotFoundException("Could not find a wishlist for user " + userId));
    }

    /**
     * Creates and saves the item to the wishlist
     *
     * @param bookId  the book id
     * @param user  the user
     */
    public void addWishlistItem(Long bookId, User user) {
        Wishlist wishlist = getRequiredByUserId(user.getId());
        Book book = bookService.getBookById(bookId)
                .orElseThrow(() -> new ResourceNotFoundException("Could not find a book by id " + bookId));

        Set<Book> wishListedBooks = wishlist.getBooks();

        wishListedBooks.add(book);

        wishlistRepository.save(wishlist);
    }

    /**
     * Deletes the item from the wishlist
     *
     * @param bookId  the book id
     * @param user  the user
     */
    public void deleteWishlistItem(Long bookId, User user) {
        Wishlist wishlist = getRequiredByUserId(user.getId());

        Set<Book> updatedBooksList = wishlist.getBooks().stream()
                .filter(book -> !book.getId().equals(bookId))
                .collect(Collectors.toSet());

        wishlist.setBooks(updatedBooksList);

        wishlistRepository.save(wishlist);
    }
}
