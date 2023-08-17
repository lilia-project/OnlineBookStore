package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.lang.NonNull;

import javax.persistence.*;

@Entity
@Setter
@Getter
@Table(name = "client_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "client_order_id")
    private Long id;
    @Enumerated(EnumType.STRING)
    private StatusOrder statusOrder;
    @NonNull
    private Double price;
    @NonNull
    private Long userId;

    public Order() {
    }

    public Order(Long id, StatusOrder statusOrder, @NonNull Double price, @NonNull Long userId) {
        this.id = id;
        this.statusOrder = statusOrder;
        this.price = price;
        this.userId = userId;
    }
}
