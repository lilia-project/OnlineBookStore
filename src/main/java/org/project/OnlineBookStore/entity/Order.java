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
    private Long id;
    @Enumerated(EnumType.STRING)
    private StatusOrder statusOrder;
    @NonNull
    private Double price;

    @ManyToOne
    @JoinColumn(name = "consumer_id")
    private User user;

    public Order() {
    }

    public Order(Long id, StatusOrder statusOrder, @NonNull Double price) {
        this.id = id;
        this.statusOrder = statusOrder;
        this.price = price;
    }
}
