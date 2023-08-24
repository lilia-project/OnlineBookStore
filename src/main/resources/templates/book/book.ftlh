<#import "/parts/common.ftlh" as c>

<@c.page>
<table class="table border="" id = "booksTable" table-light table-striped mt-7>
<thead>
<tr>
    <th>book id</th>
    <th>name</th>
    <th>price</th>
    <th>stock</th>
</tr>
</thead>
<tr data-book-id=${book.getId()}>
    <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
    <td>${book.getName()}</td>
    <td>${book.price!'-'}</td>
    <td>${book.stock!'-'}</td>

    <td>
        <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}')">Buy</button>
    </td>

</tr>


</@c.page>
