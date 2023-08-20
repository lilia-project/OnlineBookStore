package org.project.OnlineBookStore.service;

import org.project.OnlineBookStore.entity.Category;
import org.project.OnlineBookStore.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public void saveCategory(final Category category) {
        categoryRepository.save(category);
    }

    public Optional<Category> getCategoryById(final Long id) {
        return categoryRepository.findById(id);
    }

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    public Category update(Long categoryId, Category category) {
        final var toUpdate = categoryRepository.findById(categoryId);
        final var existingCategory = toUpdate.get();

        if (StringUtils.hasText(category.getName())) {
            existingCategory.setName(category.getName());
        }
        return categoryRepository.save(existingCategory);
    }

    public void deleteCategory(final Long id) {
        categoryRepository.deleteById(id);
    }

    public void deleteCategory(final Category category) {
        categoryRepository.delete(category);
    }
}
