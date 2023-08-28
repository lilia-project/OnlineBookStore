package org.project.OnlineBookStore.controller;

import org.project.OnlineBookStore.entity.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Objects;

@Controller
@RequestMapping(path = {"/", "/index", "/home"})
public class IndexController {

    @GetMapping
    public String index(Model model, @AuthenticationPrincipal User user) {
        if (Objects.nonNull(user)) {
            model.addAttribute("user", user);
            model.addAttribute("userId", user.getId());
        }
        return "index";
    }

}
