<#import "/parts/common.ftlh" as c>

<@c.page>

<form id="createForm" onsubmit="createBook(event)">
    <div class="row">
        <div class="col-md-3">
            <label for="name">Book name:</label>
            <input id="name" placeholder="name" required type="text">
        </div>
        <div class="col-md-3">
            <label for="price">Book price:</label>
            <input id="price" placeholder="price" required type="number">
        </div>
        <div class="col-md-3">
            <label for="stock">Book stock:</label>
            <input id="stock" placeholder="stock" required type="number">
        </div>
    </div>
    <input name="_csrf" type="hidden" value="${_csrf.token}"/>
    <button class="btn btn-success float-end" type="submit">Add new book</button>
</form>

</@c.page>

