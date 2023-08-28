<#import "/parts/common.ftlh" as c>

<@c.page>
    <script defer src="/js/book-edit.js"></script>

    <form id="editForm" onsubmit="editBook(event, '${book.id}')">
        <div class="row">
            <div class="col-md-3">
                <label for="name">Book name:</label>
                <input id="name" required type="text" value="${book.name}">
            </div>

            <div class="col-md-3">
                <label for="price">Book price:</label>
                <input id="price" required type="number" value="${book.price}">
            </div>

            <div class="col-md-3">
                <label for="stock">Book stock:</label>
                <input id="stock" required type="number" value="${book.stock}">
            </div>
        </div>
        <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/><br>
        <button class="btn btn-primary" type="submit">Update</button>
    </form>
</@c.page>
