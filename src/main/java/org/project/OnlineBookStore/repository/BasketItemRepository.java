package org.project.OnlineBookStore.repository;

import org.project.OnlineBookStore.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BasketItemRepository extends JpaRepository<Book, Long> {
}
