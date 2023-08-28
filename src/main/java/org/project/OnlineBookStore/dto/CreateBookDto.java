package org.project.OnlineBookStore.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

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
