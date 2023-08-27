<#import "/parts/common.ftlh" as c>

<@c.page>
<table id = "booksTable"  class="table border table-light table-striped mt-7">
<thead>
<tr>
    <th>name</th>
    <th>price</th>
    <th>stock</th>
    <th></th>
</tr>
</thead>
<tr data-book-id=${book.getId()}>
    <td>${book.getName()}</td>
    <td>${book.price!'-'}</td>
    <td>${book.stock!'-'}</td>
<!--    <td>${book.rating!'-'}</td>-->

    <td>
        <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}')">Buy</button>
    </td>

</tr>
</table>

</@c.page>
