<#import "/parts/common.ftlh" as c>

<@c.page>
<table id = "bookTable"  class="table border table-light table-striped mt-7 table-hover">
<thead>
<tr>
    <th>name</th>
    <th>price</th>
    <th>stock</th>
    <th></th>
    <th></th>
</tr>
</thead>
<tr data-book-id=${book.getId()}>
    <td>${book.getName()}</td>
    <td>${book.price!'-'}</td>
    <td>${book.stock!'-'}</td>

    <td>
        <button class="btn btn-success btn-sm" onclick="addBookToBasket(event,'${book.id}', '${_csrf.token}')">Buy</button>
    </td>
    <td>
        <a class="nav-link" onclick="showWishListAlert('${book.id}','${(_csrf.token)!''}')" data-toggle="tooltip" data-placement="left" title="Add this to your Wish List"><i class="bi bi-heart"></i></a>
    </td>
</tr>
</table>

</@c.page>
