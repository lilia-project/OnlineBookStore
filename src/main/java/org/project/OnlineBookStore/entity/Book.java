package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotBlank(message = "Name can not be Blank")
    @Length(min = 2, max = 50)
    private String name;
    @PositiveOrZero
    private Long stock;
    @PositiveOrZero
    private Long price;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "rating_id")
    private Rating rating;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "author_book",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id"))
    private Set<Author> authors = new HashSet<>();

}
