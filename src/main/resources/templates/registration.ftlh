<#import "parts/common.ftlh" as c>

<@c.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form action="/registration" class="form-inline" method="post">
            <input class="form-control" name="username" placeholder="username" type="text" required minlength="4">
            <input class="form-control" name="password" placeholder="user password" type="password" required minlength="4">
            <input class="form-control" name="email" placeholder="email" type="email" required>
            <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/>
            <button class="btn btn-primary ml-2" type="submit">Save</button>
        </form>
    </div>
</div>

</@c.page>