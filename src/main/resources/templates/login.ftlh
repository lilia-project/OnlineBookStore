<#import "parts/common.ftlh" as c>

<@c.page>
    <form action="/login" method="post">
        <div>
            <label for="username">Username:</label>
            <input id="username" name="username" required type="text">
        </div>
        <div>
            <label for="password">Password:</label>
            <input id="password" name="password" required type="password">
        </div>
        <div>
            <input id="_csrf" name="_csrf" type="hidden" value="${_csrf.token}"/>
            <button class="btn btn-primary ml-2" type="submit">Login</button>
        </div>
    </form>
</@c.page>

