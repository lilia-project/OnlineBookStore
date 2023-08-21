<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Page</title>
    <link rel="stylesheet" href="../styles.css">
    <script defer src="/js/book-edit.js"></script>
    <script defer src="/js/book-filter.js"></script>
    <script defer src="/js/book-delete.js"></script>
</head>
<body>
    <header>
       <div class="container">
          <div id="branding">
              <h1><span class="highlight">Book</span>store</h1>
          </div>
          <nav>
              <#include "../menu.ftlh">
          </nav>
       </div>
    </header>

    <main>
        <br>
            <div class="container">
                <tr><a href="/books/create-book-page">ADD NEW BOOK</a></tr>
            </div>
             <p>Filter by genre:</p>
                <select id="bookCategory">
                <#list categories as category>
                    <option value="${category.id}">${category.name}</option>
                </#list>
                </select>
            <div class="container">
                 <button onclick="filterBook()">FILTER BOOK</button>

            </div>
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

    <footer>
        <!-- Підвал сторінки можна розмістити тут -->
    </footer>
</body>
</html>
