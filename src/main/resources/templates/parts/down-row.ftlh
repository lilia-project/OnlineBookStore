<div class="container mt-2">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="/index">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/books">Catalog</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/">Discounts</a>
        </li>
        <#if isAdmin>
        <li class="nav-item">
            <a class="nav-link" href="/authors">Authors</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/categories">Categories</a>
        </li>
        </#if>
        <li class="nav-item">
            <a class="nav-link" href="/wishlist"><i class="bi bi-heart"></i></a>
        </li>
    </ul>
</div>
