package org.project.OnlineBookStore.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.project.OnlineBookStore.entity.Category;

import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;

@Data
@NoArgsConstructor
public class CreateBookDto {

    @NotBlank
    @Length(min = 2, max = 50)
    private String name;
    @PositiveOrZero
    private Long stock;
    @PositiveOrZero
    private Long price;
    private Long category;
    private Long author;

}
