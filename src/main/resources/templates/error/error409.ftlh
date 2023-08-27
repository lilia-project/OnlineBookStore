<#include "/parts/security.ftlh">
<#import "/parts/common.ftlh" as c>

<@c.page>

<div class="row">
    <div class="col-md-12 error-container">
        <div class="error-code">409</div>
        <div class="error-message">Oops! Conflict Request.</div>
        <p class="mt-4">The request could not be completed due to a conflict with the current state of the target resource.</p>
        <a href="/" class="btn btn-primary return-home-btn">Return to Home</a>
    </div>
</div>

</@c.page>