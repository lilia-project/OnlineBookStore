package org.project.OnlineBookStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/categories")
public class CategoryController {
    @GetMapping
    public String categories() {
        return "categories";
    }
}