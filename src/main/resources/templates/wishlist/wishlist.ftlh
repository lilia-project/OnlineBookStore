<#import "/parts/common.ftlh" as c>

<@c.page>
    <h1 class="text-center">Your Wish List</h1>
    <#if books?has_content>
        <table class="table table-hover mt-5" id="wishlist-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="wishlist-items">
            <!-- Тут будуть додаватися позиції замовлення -->
                <#list books as book>
                    <tr data-book-id=${book.getId()}>
                        <td><a href="/books/${book.id}">${book.name}</a></td>
                        <td>${book.price}</td>
                        <td>
                            <button class="btn btn-success btn-sm" onclick="addBookToBasketFromWishList(event,'${book.id}', '${_csrf.token}')">To Basket</button>
                            <button class="btn btn-primary btn-sm" onclick="deleteFromBasket(event,'${book.id}', '${_csrf.token}')">Delete</button>
                        </td>
                    </tr>
                </#list>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">Total Items</td>
                    <td id="wishlist-size">${books?size!0}</td>
                </tr>
                <tr>
                    <td colspan="2">Total Price</td>
                    <td id="wishlist-total">${wishListTotal}</td>
                </tr>
            </tfoot>
        </table>
    <#else>
        <h3 class="mt-5 text-center">There are no items here yet</h3>
    </#if>
</@c.page>

