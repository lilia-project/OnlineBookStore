<#import "parts/common.ftlh" as c>

<@c.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form action="/registration" class="form-inline" method="post">
            <input class="form-control" name="username" placeholder="username" type="text">
            <input class="form-control" name="password" placeholder="user password" type="password">
            <input class="form-control" name="email" placeholder="email" type="email">
            <input name="_csrf" type="hidden" value="${_csrf.token}"/>
            <button class="btn btn-primary ml-2" type="submit">Save</button>
        </form>
    </div>
</div>

</@c.page>