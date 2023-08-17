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
    @OneToOne
    @JoinColumn(name = "basket_id")
    private Basket basket;

    private Long wishlist_id;

    public User() {
    }

    public User(Long id, Role role) {
        this.id = id;
        this.role = role;
    }
}
