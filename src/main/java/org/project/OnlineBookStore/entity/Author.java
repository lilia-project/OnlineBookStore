package org.project.OnlineBookStore.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotBlank(message = "Name can not be Blank")
    private String name;
    @NotBlank(message = "Surname can not be Blank")
    private String surname;
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "authors")
    private Set<Book> books = new HashSet<>();

}
