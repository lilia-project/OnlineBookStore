<#import "/parts/common.ftlh" as c>

<@c.page>
<br>
<div class="container">
    <a class="btn btn-success btn-sm" href="/books/create-book-page">ADD NEW BOOK</a>
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
        <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}')">Buy</button>
    </td>
    <td>
        <button class="btn btn-primary btn-sm" onclick="window.location.href = '/books/${book.id}/edit-book-page'">
            Edit
        </button>
    </td>
    <td>
        <button class="btn btn-primary btn-sm" onclick="deleteBook('${book.id}')">Delete</button>
    </td>

</tr>
</#list>

</tbody>
</table>


</@c.page>



