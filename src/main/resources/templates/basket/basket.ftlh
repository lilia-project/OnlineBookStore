<#import "/parts/common.ftlh" as c>

<@c.page>

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
    </#list>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="4">Total:</td>
        <td id="cart-total">0</td>
    </tr>
    </tfoot>
</table>
</@c.page>

