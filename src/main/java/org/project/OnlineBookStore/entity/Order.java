package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
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
    @NotNull
    private Long price;
    private LocalDateTime orderTime;

    @ManyToOne
    @JoinColumn(name = "consumer_id")
    private User user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<OrderItem> orderItems = new HashSet<>();

    public Order(Long id, @NotNull Long price) {
        this.id = id;
        this.price = price;
        this.orderTime = LocalDateTime.now();
    }
}
