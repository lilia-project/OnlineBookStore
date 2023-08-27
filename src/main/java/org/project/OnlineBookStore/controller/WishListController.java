package org.project.OnlineBookStore.controller;

import lombok.RequiredArgsConstructor;
import org.project.OnlineBookStore.entity.Book;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "/wishlist")
public class WishListController {
    @PostMapping(path = "/item")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public void createItem(@RequestParam Long bookId) {

    }
}
