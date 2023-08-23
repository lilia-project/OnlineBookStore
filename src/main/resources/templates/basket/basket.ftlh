<#import "../parts/common.ftlh" as c>

<@c.page>
<div class="container mt-2">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="/index">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/books">Catalog</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Discounts</a>
        </li>
        <div class="col-md-8">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-heart"></i></a>
                </li>
            </ul>
        </div>
    </ul>
</div>

<table id="cart-table">
    <thead>
    <tr>
        <th>Book ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Count</th>
        <th>Total</th>
    </tr>
    </thead>
    <tbody id="cart-items">
    <!-- Тут будуть додаватися позиції замовлення -->
    <#list books as book>
    <tr data-book-id=${book.getId()}>
        <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
        <td>${book.getName()}</td>
        <td>${book.price}</td>
        <td>${1}</td>
        <td>${book.price *1}</td>

    </tr>
    </
    #list>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="4">Total:</td>
        <td id="cart-total">0</td>
    </tr>
    </tfoot>
</table>
</@c.page>

