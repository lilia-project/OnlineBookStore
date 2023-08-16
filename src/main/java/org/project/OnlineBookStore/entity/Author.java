package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotBlank(message = "Name can not be Blank")
    private String name;
    @NotBlank(message = "Surname can not be Blank")
    private String surname;
    @ManyToMany(mappedBy = "authors")
    private Set<Book> books = new HashSet<>();

}
