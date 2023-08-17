package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.lang.NonNull;

import javax.persistence.*;

@Entity
@Setter
@Getter
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NonNull
    private Long bookId;
    @NonNull
    private Double count;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    public OrderItem() {
    }

    public OrderItem(Long id, @NonNull Long bookId, @NonNull Double count) {
        this.id = id;
        this.bookId = bookId;
        this.count = count;
    }
}