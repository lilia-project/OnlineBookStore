<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>
<div class="container">
    
    <#if isAdmin>
        <a class="btn btn-success btn-sm" href="/books/create-book-page">ADD NEW BOOK</a>
    </#if>
    <div>
        <div class="mb-3>
            <label class="form-label">Book category:</label>
            <select class="form-select" id="bookCategory">
                <option value="" selected="selected"></option>
                <#list categories as category>
                    <option value="${category.id}">${category.name}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3>
            <label class="form-label">Book author:</label>
            <select class="form-select" id="bookAuthor">
                <option value="" selected="selected"></option>
                <#list authors as author>
                    <option value="${author.id}">${author.name + ' '+ author.surname}</option>
                </#list>
            </select>
        </div>

        <div class="mb-3>
            <label class="form-label">Sort:</label>
            <select class="form-select" id="bookSort">
                <option value="rating(default)" selected="selected"></option>
                <option value="price"></option>
                <option value="available"></option>
            </select>
        </div>

        <div class="mb-3">
            <label for="bookTitle" class="form-label">Book title:</label>
            <input class="form-control" type="text" id="bookTitle" placeholder="book title">
        </div>

        <button class="btn btn-primary mt-3" onclick="searchBooks()">Search</button>
    
    </div>

<!--<div class="alert alert-success" id="success-alert">
    <button type="button" class="close" data-dismiss="alert">x</button>
    <strong>Success! </strong> Product have added to your wishlist.
</div>-->
<table class="table border="" id = "booksTable" table-light table-striped mt-7>
<thead>
<tr>
    <th>book id</th>
    <th>name</th>
    <th>price</th>
    <th>stock</th>
</tr>
</thead>
<tbody>

<#list books as book>
<tr data-book-id=${book.getId()}>
    <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
    <td>${book.getName()}</td>
    <td>${book.price!'-'}</td>
    <td>${book.stock!'-'}</td>

    <td>
        <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}', '${_csrf.token}')">Buy</button>
    </td>
    <td>
        <a class="nav-link" href="/books"><i class="bi bi-heart"></i></a>
<!--        <a class="btn btn-success btn-sm" href="/books/create-book-page"><i class="bi bi-heart"></i></a>-->

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

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a aria-label="Previous" class="page-link" href="#">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a aria-label="Next" class="page-link" href="#">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
</@c.page>



