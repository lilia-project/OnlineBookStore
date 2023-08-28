package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class BasketItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @PositiveOrZero
    private Long bookId;
    @Positive
    private Long unitPrice;
    @Positive
    private Long count;

    @ManyToOne(fetch = FetchType.EAGER)
    private Basket basket;
}
