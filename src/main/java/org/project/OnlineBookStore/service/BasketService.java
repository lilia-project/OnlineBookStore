package org.project.OnlineBookStore.service;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.entity.BasketItem;
import org.project.OnlineBookStore.entity.Book;
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

    public void deleteBasket(final Basket basket) {
        basketRepository.delete(basket);
    }

    public void createBasketItem(Long bookId) {
        Book book = bookService.getBookById(bookId).orElseThrow();
        if (book.getStock() == 0) {
            throw new BookOutOfStockException("book is out of stock");
        }
        Basket currentBasket = getCurrentBasket();
        Set<BasketItem> basketItems = currentBasket.getBasketItems();

        BasketItem basketItem = new BasketItem();
        basketItem.setBookId(bookId);
        basketItem.setCount(1L);
        basketItem.setUnitPrice(book.getPrice());
        basketItem.setBasket(currentBasket);

        basketItems.add(basketItem);

        basketRepository.save(currentBasket);
    }

    public Basket getCurrentBasket() {
        return getBasketById(1L).orElseThrow();

    }

}
