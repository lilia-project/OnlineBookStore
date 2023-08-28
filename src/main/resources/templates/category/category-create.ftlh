<#import "/parts/common.ftlh" as c>

<@c.page>
    <form id="createForm" onsubmit="createCategory(event)">
        <div class="row">
            <div class="col-md-3">
                <label for="name">Category name:</label>
                <input class="form-control mb-2" id="name" placeholder="name" required type="text">
            </div>
        </div>
        <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/>
        <button class="btn btn-success float-end" type="submit">Create new Category</button>
    </form>
</@c.page>
