<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authors page</title>
    <link rel="stylesheet" href="../styles.css">
    <script defer src="js/author-edit.js"></script>
    <script defer src="/js/author-delete.js"></script>
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
                <tr><a href="/authors/create-author-page">ADD NEW AUTHOR</a></tr>
            </div>
        <br>
            <div class="container">
             <h1>Select Your Preferred Book Genre:</h1>
                <select>
                    <option value="science_fiction">Science Fiction</option>
                    <option value="mystery_thrillers">Mystery and Thrillers</option>
                    <option value="romance">Romance</option>
                    <option value="fantasy">Fantasy</option>
                    <!-- Додайте інші опції тут -->
                </select>
                <tr><a href="/authors/filter">FILTER</a></tr>
            </div>
        <br>
        <table border="2px" id = "authorsTable">
           <thead>
             <tr>
                 <th>author id</th>
                 <th>name</th>
                 <th>surname</th>
             </tr>
           </thead>
           <tbody>
                <#list authors as author>
                    <tr data-author-id = ${author.getId()}>
                        <td><a href="/authors/${author.getId()}"><p>${author.getId()}</a></td>
                        <td>${author.getName()}</td>
                        <td>${author.getSurname()}</td>
                        <td><button onclick="window.location.href = '/authors/${author.id}/edit-author-page'">Edit</button></td>

                        <td><button onclick="deleteAuthor('${author.id}')">Delete</button></td>
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
