package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.repository.BasketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BasketService {
    private final BasketRepository basketRepository;

    @Autowired
    public BasketService(BasketRepository basketRepository) {
        this.basketRepository = basketRepository;
    }

    public void saveBasket(final Basket basket) {
        basketRepository.save(basket);
    }

    public List<Basket> getBaskets() {
        return basketRepository.findAll();
    }

    public Optional<Basket> getBasketById(final Long id) {
        return basketRepository.findById(id);
    }

    public void deleteBasket(final Basket basket) {
        basketRepository.delete(basket);
    }
}
