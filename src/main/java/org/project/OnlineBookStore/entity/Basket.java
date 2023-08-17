package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
@Table(name = "basket")
public class Basket {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "basket_id")
    private Long id;
}
