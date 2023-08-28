<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>
<div >
    <div>
        <div class="mb-3">
            <label class="form-label">Book category:</label>
            <select class="form-select" id="bookCategory">
                <option value=""></option>
                <#list categories as category>
                    <option value="${category.id}" <#if category.id = (categoryId)!-1>selected="selected"</#if>>${category.name}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Book author:</label>
            <select class="form-select" id="bookAuthor">
                <option value=""></option>
                <#list authors as author>
                    <option value="${author.id}" <#if author.id = (authorId)!-1>selected="selected"</#if>>${author.name + ' '+ author.surname}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Sort:</label>
            <select class="form-select" id="bookSortElement">
                <option value=""></option>
                <option value="rating" <#if 'rating' = (bookSort)!''>selected="selected"</#if>>rating</option>
                <option value="price" <#if 'price' = (bookSort)!''>selected="selected"</#if>>price</option>
                <option value="available" <#if 'available' = (bookSort)!''>selected="selected"</#if>>available</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="bookTitleElement" class="form-label">Book title:</label>
            <input class="form-control" type="text" id="bookTitleElement" placeholder="book title" value="${bookTitle!''}">
        </div>

        <button class="btn btn-success mt-3" onclick="searchBooks()">Search</button>
    </div>
        <br>
        <div>
            <th>
                <#if isAdmin>
                    <a class="btn btn-primary btn-sm" href="/books/create-book-page">Add</a>
            </#if>

            </th>
        </div>

    <div class="alert alert-primary alert-dismissible fade show d-none" id="book-wish-listed-alert" role="alert">
        The book have been added to <a href="/basket" class="alert-link">Basket</a>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
        <table id = "booksTable" class="table border table-light table-striped mt-7 table-hover">
            <thead>
                <tr>
                    <#if isAdmin>
                        <th>id</th>
                    </#if>
                    <th>name</th>
                    <th>price</th>
                    <#if isAdmin>
                        <th>stock</th>
                    </#if>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <#list books as book>
                    <tr data-book-id=${book.getId()}>
                        <#if isAdmin>
                            <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
                        </#if>
                        <td><a href="/books/${book.getId()}"><p>${book.getName()}</a></td>
                        <td>${book.price!'-'}</td>
                        <#if isAdmin>
                            <td>${book.stock!'-'}</td>
                        </#if>
                        <td>
                            <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}', '${_csrf.token}')">Buy</button>
                        </td>

                        <td>
                            <a class="nav-link" onclick="saveOrDeleteWishListItem('${book.id}','${(_csrf.token)!''}')" data-toggle="tooltip" data-placement="left" title="Add this to your Wish List"><i class="bi bi-heart"></i></a>
                        </td>

                        <td>
                            <#if isAdmin>
                                <button class="btn btn-primary btn-sm" onclick="window.location.href = '/books/${book.id}/edit-book-page'">
                                    Edit
                                </button>
                            </#if>
                        </td>

                        <td>
                            <#if isAdmin>
                                <button class="btn btn-primary btn-sm" onclick="deleteBook('${book.id}','${_csrf.token}')">
                                    Delete
                                </button>
                            </#if>
                        </td>
                    </tr>
                </#list>
                <#if isAdmin>
                    <tr class="cursor-pointer" onclick="window.location='/books/create-book-page'">
                        <td colspan="8" class="text-center">➕</td>
                    </tr>
                </#if>
            </tbody>
        </table>
        <div>
            <nav>
                <ul class="pagination justify-content-center">
                    <#if (pages > 1)>
                        <#list 1..pages as i>
                            <li class="page-item"><a class="page-link" href="/books?page=${i}#booksTable">${i}</a></li>
                        </#list>
                    </#if>
                </ul>
            </nav>
         </div>
</div>
</@c.page>



