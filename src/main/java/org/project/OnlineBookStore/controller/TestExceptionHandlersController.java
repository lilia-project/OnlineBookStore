package org.project.OnlineBookStore.controller;

import org.project.OnlineBookStore.exception.BookOutOfStockException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class TestExceptionHandlersController {

        @GetMapping("/500")
        public String error() {
            throw new RuntimeException("Error");
        }

        @GetMapping("/409")
        public String outOfStock() {
            throw new BookOutOfStockException("Out");
        }

}
