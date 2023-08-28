<#import "/parts/common.ftlh" as c>

<@c.page>
<form id="editForm" onsubmit="editCategory(event, '${category.id}')">
    <div class="row">
        <div class="col-md-4">
            <label for="name">Name</label>
            <input class="form-control mb-2" id="name" required type="text" value="${category.name}">
        </div>
    </div>
    <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/><br>
    <input class="btn btn-primary btn-sm" type="submit" value="Update">
</form>
</@c.page>
