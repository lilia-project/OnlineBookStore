package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Category;
import org.project.OnlineBookStore.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    private CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public void saveCategory(final Category category) {
        categoryRepository.save(category);
    }

    public List<Category> getCategory() {
        return categoryRepository.findAll();
    }

    public Optional<Category> getCategoryById(final Long id) {
        return categoryRepository.findById(id);
    }

    public void deleteCategory(final Category category) {
        categoryRepository.delete(category);
    }


}
