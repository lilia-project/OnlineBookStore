package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Book;
import org.project.OnlineBookStore.entity.User;
import org.project.OnlineBookStore.entity.Wishlist;
import org.project.OnlineBookStore.service.WishlistService;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "/wishlist")
public class WishListController {
    private final WishlistService wishlistService;

    @GetMapping
    public String wishlist(Model model, @AuthenticationPrincipal User user) {
        Wishlist wishlist = wishlistService.findByUserId(user.getId())
                .orElseThrow(() -> new RuntimeException("Could not find a wishlist for user " + user.getId()));
        Long total = wishlist.getBooks().stream()
                .map(Book::getPrice)
                .mapToLong(Long::longValue)
                .sum();

        model.addAttribute("books", wishlist.getBooks());
        model.addAttribute("wishListTotal", total);

        return "wishlist/wishlist";
    }

    @PostMapping(path = "/item")
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public void createItem(@RequestParam Long bookId, @AuthenticationPrincipal User user) {
        wishlistService.addWishlistItem(bookId, user);
    }

    @DeleteMapping(path = "/item")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public void deleteItem(@RequestParam Long bookId, @AuthenticationPrincipal User user) {
        wishlistService.deleteWishlistItem(bookId, user);
    }
}
