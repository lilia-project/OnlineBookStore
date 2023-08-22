<#import "parts/common.ftlh" as c>

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
                            <a href="#" class="nav-link"><i class="bi bi-heart"></i></a>
                        </li>
                    </ul>
                </div>
            </ul>
        </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8">
                <h2>Welcome to our bookstore!</h2>
                <p>We offer a wide range of books for all genres and interests.</p>
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