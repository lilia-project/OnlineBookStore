package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.entity.BasketItem;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.service.BasketItemService;
import org.project.OnlineBookStore.service.BasketService;
import org.project.OnlineBookStore.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "/basket")
public class BasketController {
    private final BasketService basketService;
    private final BasketItemService basketItemService;
    private final BookService bookService;

    @GetMapping
    public String getBasket(Model model) {
//        final List<Book> books = basketService.getBooksFromBasket(basketId);
        Basket basketById = basketService.getBasketById(1L).orElseThrow();
        Set<Long> collect = basketById.getBasketItems().stream()
                .map(BasketItem::getBookId)
                .collect(Collectors.toSet());
        List<Book> books = bookService.getAllByIds(collect);
        model.addAttribute("books", books);
        return "basket/basket";
    }

    @PostMapping(path = "/item")
    @ResponseBody
    public void createBasketItem(@RequestParam Long bookId) {
        basketService.createBasketItem(bookId);
    }

}
