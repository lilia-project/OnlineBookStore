package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.lang.NonNull;

import javax.persistence.*;

@Entity
@Setter
@Getter
public class OrderItem {

    @ManyToOne
    @JoinColumn(name = "client_order_id")
    public Order order;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "order_item_id")
    private Long id;
    @NonNull
    private Long bookId;
    @NonNull
    private Double count;

    public OrderItem() {
    }

    public OrderItem(Long id, @NonNull Long bookId, @NonNull Double count) {
        this.id = id;
        this.bookId = bookId;
        this.count = count;
    }
}