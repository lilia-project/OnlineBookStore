package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Basket;
import org.project.OnlineBookStore.entity.BasketItem;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.service.BasketService;
import org.project.OnlineBookStore.service.BookService;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
    private final BookService bookService;

    @GetMapping
    public String getBasket(Model model, @AuthenticationPrincipal User user) {
        Basket basketById = basketService.getBasketByUserId(user.getId()).orElseThrow();
        Set<Long> collect = basketById.getBasketItems().stream()
                .map(BasketItem::getBookId)
                .collect(Collectors.toSet());
        List<Book> books = bookService.getAllByIds(collect);
        model.addAttribute("books", books);
        return "basket/basket";
    }

    @PostMapping(path = "/item")
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public void createBasketItem(@RequestParam(required = false, defaultValue = "false") boolean removeFromWishList,
                                 @RequestParam Long bookId,
                                 @AuthenticationPrincipal User user) {
        if (!removeFromWishList) {
            basketService.createBasketItem(bookId, user);
        } else {
            basketService.moveFromWishListToBasket(bookId, user);
        }
    }

}
