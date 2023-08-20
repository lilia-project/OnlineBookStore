package org.project.OnlineBookStore.controller;

import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.service.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class BasketController {
    private BasketService basketService;

    @Autowired
    public BasketController(BasketService basketService) {
        this.basketService = basketService;
    }

    @PostMapping//создать новый экземпляр в БД
    public String createNewBasket(@RequestBody Basket basket) {
        basketService.saveBasket(basket);
        return "redirect:/baskets";
    }
}
