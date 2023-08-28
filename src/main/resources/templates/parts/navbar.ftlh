<#include "security.ftlh">

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand text-white custom-font">LETTER </a>
        <div class="login-register">
            <#if known>
                <a class="text-blue" href="/user/profile">Hello ${user.username}!</a><br>
                <a class="text-white" href="/logout">Logout</a>
            <#else>
                <a class="text-blue" href="/registration">Hello unknown!</a><br>
                <a class="text-white" href="/login">Login</a><br>
                <a class="text-white" href="/registration">Register</a>
            </#if>
        </div>
    </div>
</nav>

