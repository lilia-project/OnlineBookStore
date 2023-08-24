<#import "/parts/common.ftlh" as c>

<@c.page>
<form id="editForm" onsubmit="editBook(event, '${book.id}')">
    <div class="row">
        <div class="col-md-4">
            <label for="name">Name: <span aria-label="required">*</span></label>
            <input id="name" required type="text" value="${book.name}">
        </div>
        <div class="col-md-4">
            <label for="name">Book price: <span aria-label="required">*</span></label>
            <input id="price" required type="number" value="${book.price}">
        </div>
        <div class="col-md-4">
            <label for="name">Book stock: <span aria-label="required">*</span></label>
            <input id="stock" required type="number" value="${book.stock}">
        </div>
    </div>
    <input class="button" type="submit" value="Update">
</form>
</@c.page>
