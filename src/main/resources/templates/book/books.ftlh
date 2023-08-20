<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Page</title>
    <link rel="stylesheet" href="../styles.css">
    <script defer src="js/book-edit.js"></script>
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
             <h3>Select your preferred book genre:</h3>
                <select>
                    <option value="detectives_and_thrillers">Detectives and thrillers</option>
                    <option value="romance">Romance</option>
                    <option value="adventure">Adventure</option>
                    <option value="fantasy">Fantasy</option>
                    <option value="classical_literature">Classical literature</option>
                    <option value="science">Science</option>
                    <option value="psychology_and_self_development">Psychology and self-development</option>
                    <option value="mystery_thrillers">Mystery and Thrillers</option>
                    <option value="art_and_music">Art and Music</option>
                    <option value="sports_and_fitness">Sports and fitness</option>
                    <option value="cooking">Cooking</option>
                    <option value="comics">Comics</option>
                    <option value="religion_and_spirituality">Religion and Spirituality</option>
                    <!-- Додайте інші опції тут -->
                </select>
            <div class="container">
                <tr><a href="/books/filter">FILTER BOOK</a></tr>
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
