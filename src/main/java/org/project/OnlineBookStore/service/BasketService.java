package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.entity.BasketItem;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.exception.BookOutOfStockException;
import org.project.OnlineBookStore.repository.BasketItemRepository;
import org.project.OnlineBookStore.repository.BasketRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class BasketService {
    private final BasketRepository basketRepository;
    private final BasketItemRepository basketItemRepository;
    private final BookService bookService;

    public void saveBasket(final Basket basket) {
        basketRepository.save(basket);
    }

    public Optional<Basket> getBasketById(final Long id) {
        return basketRepository.findById(id);
    }

    public Optional<Basket> getBasketByUserId(final Long userId){
       return basketRepository.findByUserId(userId);
    }

    public void deleteBasket(final Basket basket) {
        basketRepository.delete(basket);
    }

    public void createBasketItem(Long bookId, User user) {
        Long defaultCount = 1L;
        Book book = bookService.getBookById(bookId).orElseThrow();
        if (book.getStock() == 0) {
            throw new BookOutOfStockException("book is out of stock");
        }
        Basket currentBasket = getCurrentBasket(user);
        Set<BasketItem> basketItems = currentBasket.getBasketItems();

        BasketItem basketItem = new BasketItem();
        basketItem.setBookId(bookId);
        basketItem.setCount(defaultCount);
        basketItem.setUnitPrice(book.getPrice());
        basketItem.setBasket(currentBasket);

        basketItems.add(basketItem);

        basketRepository.save(currentBasket);
    }

    public Basket getCurrentBasket(User user) {
        return getBasketByUserId(user.getId()).orElseGet(() -> {
            Basket basket = new Basket();
            basket.setUser(user);
            basket.setTotal(0L);
           return basketRepository.save(basket);
        });
    }
}
