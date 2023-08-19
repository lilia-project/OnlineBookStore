package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.lang.NonNull;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Setter
@Getter
@NoArgsConstructor
@Table(name = "client_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Enumerated(EnumType.STRING)
    private StatusOrder statusOrder;
    @NonNull
    private Long price;
    private LocalDateTime orderTime;

    @ManyToOne
    @JoinColumn(name = "consumer_id")
    private User user;

    @ManyToMany(mappedBy = "orders")
    private Set<OrderItem> orderItems = new HashSet<>();

    public Order(Long id, StatusOrder statusOrder, @NonNull Long price, Set<OrderItem> orderItems) {
        this.id = id;
        this.statusOrder = statusOrder;
        this.price = price;
        this.orderTime = LocalDateTime.now();
        this.orderItems = orderItems;
    }
}
