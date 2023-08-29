package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.entity.BasketItem;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.exception.BookOutOfStockException;
import org.project.OnlineBookStore.repository.BasketRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class BasketService {
    private final BasketRepository basketRepository;
    private final BookService bookService;
    private final WishlistService wishlistService;

    public void saveBasket(final Basket basket) {
        basketRepository.save(basket);
    }

    public Optional<Basket> getBasketByUserId(final Long userId) {
        return basketRepository.findByUserId(userId);
    }

    /**
     * Creates and saves the item to the basket
     *
     * @param bookId  the book id
     * @param user  the user
     */
    public void createBasketItem(Long bookId, User user) {
        Long defaultCountItem = 1L;
        Book book = bookService.getBookById(bookId).orElseThrow();
        if (book.getStock() == 0) {
            throw new BookOutOfStockException("book is out of stock");
        }
        Basket currentBasket = getCurrentBasket(user);
        Set<BasketItem> basketItems = currentBasket.getBasketItems();

        BasketItem basketItem = new BasketItem();
        basketItem.setBookId(bookId);
        basketItem.setCount(defaultCountItem);
        basketItem.setUnitPrice(book.getPrice());
        basketItem.setBasket(currentBasket);

        basketItems.add(basketItem);

        basketRepository.save(currentBasket);
    }

    /**
     * Creates the basket for current user
     *
     * @param user  the user
     * @return  the default basket
     */
    public Basket getCurrentBasket(User user) {
        Long defaultTotal = 0L;
        return getBasketByUserId(user.getId()).orElseGet(() -> {
            Basket basket = new Basket();
            basket.setUser(user);
            basket.setTotal(defaultTotal);
            return basketRepository.save(basket);
        });
    }

    /**
     * Moves the book from the wishlist to the basket
     *
     * @param bookId  the book id
     * @param user  the user
     */
    public void moveFromWishListToBasket(Long bookId, User user) {
        wishlistService.deleteWishlistItem(bookId, user);
        createBasketItem(bookId, user);
    }
}
