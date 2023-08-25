<#include "/parts/security.ftlh">
<#import "parts/common.ftlh" as c>

<@c.page>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-10">
            <h2>Welcome to our bookstore!</h2>
            <p>We offer a wide range of books for all genres and interests.</p>
            <img alt="logo" class="mr-2" height="300" src="/img/book.jpeg" width="300">

        </div>

    </div>

    <div class="row mt-4">
        <div class="col-md-6">
            <h3>Popular Books</h3>
            <ul class="list-group">
                <li class="list-group-item">Book 1</li>
                <li class="list-group-item">Book 2</li>
                <li class="list-group-item">Book 3</li>
            </ul>
        </div>
        <div class="col-md-6">
            <h3>Featured Authors</h3>
            <ul class="list-group">
                <li class="list-group-item">Author 1</li>
                <li class="list-group-item">Author 2</li>
                <li class="list-group-item">Author 3</li>
            </ul>
        </div>
    </div>
</div>

</@c.page>