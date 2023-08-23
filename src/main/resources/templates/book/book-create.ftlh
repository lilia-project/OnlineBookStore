<#import "../parts/common.ftlh" as c>

<@c.page>
<!-- Верхній ряд вкладок -->
<div class="container mt-2">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="/index">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/books">Catalog</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Discounts</a>
        </li>
        <div class="col-md-8">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-heart"></i></a>
                </li>
            </ul>
        </div>
    </ul>
</div>
<br>
<br>
<section>
    <form id="createForm" onsubmit="createBook(event)">
        <div class="row">
            <div class="col-md-3">
                <label for="name">Book name:</label>
                <input id="name" placeholder="name" required type="text">
            </div>
            <div class="col-md-3">
                <label for="price">Book price:</label>
                <input id="price" placeholder="price" required type="number">
            </div>
            <div class="col-md-3">
                <label for="stock">Book stock:</label>
                <input id="stock" placeholder="stock" required type="number">
            </div>
        </div>
        <button class="btn btn-success float-end" type="submit">Add new book</button>
    </form>
</section>
</@c.page>

