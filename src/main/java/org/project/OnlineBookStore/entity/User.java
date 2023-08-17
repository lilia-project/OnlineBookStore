package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
@Table(name = "consumer")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "consumer_id")
    private Long id;
    @Enumerated(EnumType.STRING)
    private Role role;
    private Long basket_id;

    private Long wishlist_id;

    public User() {
    }

    public User(Long id, Role role, Long basket_id, Long wishlist_id) {
        this.id = id;
        this.role = role;
        this.basket_id = basket_id;
        this.wishlist_id = wishlist_id;
    }
}
