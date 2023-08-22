<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Page</title>
    <link rel="stylesheet" href="../styles1.css">
    <script defer src="/js/book-edit.js"></script>
    <script defer src="/js/book-filter.js"></script>
    <script defer src="/js/book-filter-by-author.js"></script>
    <script defer src="/js/book-delete.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

</head>

<body>
<header>
  <!-- Додатковий ряд вкладок -->
        <div class="container mt-2 small-tabs">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                     <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Delivery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Payment</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Return Policy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-cart"></i></a>
                </li>
            </ul>
        </div>

  <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand text-white custom-font">LETTER <img src="/book.jpeg" class="mr-2" width="30" height="30"></a>
            <div class="login-register">
                <a href="#" class="text-white">Login</a> | <a href="#" class="text-white">Logout</a><br>
                <a href="#" class="text-white">Register</a>
            </div>
        </div>
    </nav>

    <!-- Верхній ряд вкладок -->
    <div class="container mt-2">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="/index">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/books">Catalog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Discounts</a>
            </li>
        </ul>
    </div>
</header>
   <main>





        <br>
            <div class="container">
                <tr><a href="/books/create-book-page">ADD NEW BOOK</a></tr>
            </div>
            <tr>
                <select id="bookCategory">
                <#list categories as category>
                    <option value="${category.id}">${category.name}</option>
                </#list>
                </select>
            </tr>
            <div class="container">
                 <button onclick="filterBook()">FILTER BY GENRE</button>
            </div>

            <div class="container">
            <button onclick="filterBookByAuthor()">SEARCH BY AUTHOR</button>
            </div>

<table class="table table-dark table-striped-columns">
  <thead>
    <tr>
      <th scope="col">book id</th>
      <th scope="col">name</th>
      <th scope="col">price</th>
      <th scope="col">stock</th>
    </tr>
  </thead>
  <tbody>
                  <#list books as book>
                      <tr data-book-id = book.getId()>
                          <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
                          <td>${book.getName()}</td>
                          <td>${book.price!'-'}</td>
                          <td>${book.stock!'-'}</td>
                          <td><button onclick="window.location.href = '/books/${book.id}/edit-book-page'">Edit</button></td>
                          <td><button onclick="deleteBook('${book.id}')">Delete</button></td>
                          <td><button onclick="buyBook('${book.id}')">Buy</button></td>
                      </tr>
                  </#list>
  </tbody>
</table>

        <br>
        <table border="2px" id = "booksTable">
           <thead>
             <tr>
                 <th>book id</th>
                 <th>name</th>
                 <th>price</th>
                 <th>stock</th>
             </tr>
           </thead>
           <tbody>
                <#list books as book>
                    <tr data-book-id = ${book.getId()}>
                        <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
                        <td>${book.getName()}</td>
                        <td>${book.price!'-'}</td>
                        <td>${book.stock!'-'}</td>
                        <td><button onclick="window.location.href = '/books/${book.id}/edit-book-page'">Edit</button></td>
                        <td><button onclick="deleteBook('${book.id}')">Delete</button></td>
                        <td><button onclick="buyBook('${book.id}')">Buy</button></td>
                    </tr>
                </#list>
           </tbody>
        </table>
    </main>
   <footer class="mt-4 py-2 bg-light footer">
             <div class="container text-center">
                 <p>&copy; 2023 Bookstore. All rights reserved.</p>
             </div>
         </footer>

         <!-- Підключення скриптів Bootstrap та jQuery -->
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
     </body>
     </html>
