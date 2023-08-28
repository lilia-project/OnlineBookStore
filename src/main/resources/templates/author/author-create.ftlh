<#import "/parts/common.ftlh" as c>

<@c.page>
    <form id="createForm" onsubmit="createAuthor(event)">
        <div class="row">
            <div class="col-md-3">
                <label for="name">Author name:</label>
                <input class="form-control mb-2" id="name" placeholder="name" required type="text">
            </div>
            <div class="col-md-3">
                <label for="name">Author surname:</label>
                <input class="form-control mb-2" id="surname" placeholder="surname" required type="text">
            </div>
        </div>
        <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/>
        <button class="btn btn-success float-end" type="submit">Create new Author</button>
    </form>
</@c.page>
