<#include "security.ftlh">

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand text-white custom-font">LETTER </a>
        <div class="login-register">
            <#if known>
            Hello ${user.getEmail()}! |
            <a class="text-white" href="/logout">Logout</a>
            <#else>
            <a class="text-white" href="/login">Login</a><br>
            <a class="text-white" href="/registration">Register</a>
        </
        #if>
    </div>
    </div>
</nav>

