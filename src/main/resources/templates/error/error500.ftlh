<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>

<div class="row">
    <div class="col-md-12 error-container">
<!--        <img src="https://via.placeholder.com/400" alt="Error Image" class="error-image">-->
        <div class="error-code">404</div>
        <div class="error-message">Oops! Page not found.</div>
        <p class="mt-4">The page you are looking for might have been removed or is temporarily unavailable.</p>
        <a href="/" class="btn btn-primary return-home-btn">Return to Home</a>
    </div>
</div>

</@c.page>