package org.project.OnlineBookStore.controller;

import org.project.OnlineBookStore.entity.Category;
import org.project.OnlineBookStore.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/categories")
public class CategoryController {

    private final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/create-category-page")
    public String createCategoryForm() {
        return "category/category-create";
    }

    @PostMapping
    public String createNewCategory(@RequestBody Category category) {
        categoryService.saveCategory(category);
        return "redirect:/categories";
    }

    @GetMapping
    public String getAllCategories(Model model) {
        final List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "category/categories";
    }

    @GetMapping("/{id}")
    public String getCategoryById(Model model, @PathVariable Long id) {
        final Optional<Category> categoryById = categoryService.getCategoryById(id);
        final Category category = categoryById.orElse(null);
        model.addAttribute("category", category);
        model.addAttribute("id", id);
        return "category/category";
    }

    @GetMapping("/{categoryId}/edit-category-page")
    public String editCategoryPage(@PathVariable Long categoryId, Model model) {
        Optional<Category> category = categoryService.getCategoryById(categoryId);
        model.addAttribute("category", category.get());

        return "category/category-edit";
    }

    @PutMapping("/{categoryId}")
    @ResponseBody
    public Category update(@RequestBody @Valid Category category, @PathVariable Long categoryId) {
        return categoryService.update(categoryId, category);
    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public void delete(@PathVariable Long id) {
        categoryService.deleteCategory(id);
    }

    @GetMapping("/filter")
    public void filtrate() {
        categoryService.findAll();
    }

}