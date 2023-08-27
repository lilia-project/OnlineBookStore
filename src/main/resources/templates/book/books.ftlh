<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>
<div >
    <div>
        <div class="mb-3">
            <label class="form-label">Book category:</label>
            <select class="form-select" id="bookCategory">
                <option value="" selected="selected"></option>
                <#list categories as category>
                    <option value="${category.id}">${category.name}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Book author:</label>
            <select class="form-select" id="bookAuthor">
                <option value="" selected="selected"></option>
                <#list authors as author>
                    <option value="${author.id}">${author.name + ' '+ author.surname}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Sort:</label>
            <select class="form-select" id="bookSort">
                <option value="" selected="selected"></option>
                <option value="rating">rating</option>
                <option value="price">price</option>
                <option value="available">available</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="bookTitle" class="form-label">Book title:</label>
            <input class="form-control" type="text" id="bookTitle" placeholder="book title">
        </div>

        <button class="btn btn-success mt-3" onclick="searchBooks()">Search</button>
    </div>
        <br>
        <div>
            <th>
                <#if isAdmin>
<!--                    <button class="btn btn-primary btn-sm" onclick="window.location.href=/book/create-book-page">Add </button>-->
                    <a class="btn btn-primary btn-sm" href="/books/create-book-page">Add</a>
            </#if>

            </th>
        </div>

    <div class="alert alert-primary alert-dismissible fade show d-none" id="book-wish-listed-alert" role="alert">
        The book have been added to <a href="/basket" class="alert-link">Basket</a>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
        <table id = "booksTable" class="table border table-light table-striped mt-7">
            <thead>
                <tr>
                    <#if isAdmin>
                    <th>id</th>
                    </#if>
                    <th>name</th>
                    <th>price</th>
                    <th>stock</th>
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

<!--                        <td>${book.getName()}</td>-->
                        <td>${book.price!'-'}</td>
                        <td>${book.stock!'-'}</td>

                        <td>
                            <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}', '${_csrf.token}')">Buy</button>
                        </td>

                        <td>
                            <a class="nav-link" onclick="showWishListAlert('${book.id}','${(_csrf.token)!''}')" data-toggle="tooltip" data-placement="left" title="Add this to your Wish List"><i class="bi bi-heart"></i></a>
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
            </tbody>
        </table>
        <div>
            <nav>
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="/books?page=1">1</a></li>
                    <li class="page-item"><a class="page-link" href="/books?page=2">2</a></li>
                    <li class="page-item"><a class="page-link" href="/books?page=3">3</a></li>
                </ul>
            </nav>
         </div>
</div>
</@c.page>



