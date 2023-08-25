<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>
<div class="container">
    ${isAdmin?c}
    <#if isAdmin>
    <a class="btn btn-success btn-sm" href="/books/create-book-page">ADD NEW BOOK</a>
    </#if>
    <select class="form-select mt-2" id="bookCategory">
        <#list categories as category>
        <option value="${category.id}">${category.name}</option>
    </#list>
    </select>
    <button class="btn btn-primary mt-2" onclick="filterBook()">FILTER BY GENRE</button>
    <button class="btn btn-primary mt-2" onclick="filterBookByAuthor()">SEARCH BY AUTHOR</button>
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
</@c.page>



