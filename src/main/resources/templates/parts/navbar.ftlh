<#include "security.ftlh">

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand text-white custom-font">LETTER </a>
        <div class="login-register">
            <#if known>
            <div>
                <#if known>
                Hello ${user.getEmail()}!
                <#else>
                Hello unknown!
            </
            #if>
            <a class="text-white" href="/logout">Logout</a>
        </div>
        <#else>
        <a class="text-white" href="/login">Login</a><br>
        <a class="text-white" href="/registration">Register</a>
    </
    #if>
    </div>
    </div>
</nav>

