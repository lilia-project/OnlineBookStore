package org.project.OnlineBookStore.dto;

import lombok.Data;

@Data
public class BookFiltersDto {
    private Long bookAuthorId;
    private Long bookCategoryId;
    private String bookTitle;
    private String bookSort;
}
