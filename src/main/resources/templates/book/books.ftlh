<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empty Page</title>
    <link rel="stylesheet" href="../styles.css">
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
        <br>
        <table border="2px" id = "booksTable">
           <thead>
             <tr>
                 <th>book id</th>
                 <th>name</th>
                 <th>price</th>
                 <th>author id</th>
                 <th>stock</th>
             </tr>
           </thead>
           <tbody>
                <#list books as book>
                    <tr data-book-id = ${book.getId()}>
                        <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
                        <td>${book.getName()}</td>
                        <td>${book.price!'-'}</td>
                        <td>${book.authorId!'-'}</td>
                        <td>${book.stock!'-'}</td>
                        <td><button onclick="deleteBook('${book.id}')">Delete</button></td>
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
