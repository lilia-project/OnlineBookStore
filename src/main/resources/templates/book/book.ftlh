<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empty Page</title>
    <link rel="stylesheet" href="../styles.css">
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
        <table border="2px">
            <thead>
                <tr>
                    <th>book id</th>
                    <th>name</th>
                    <th>price</th>
                    <th>stock</th>
                </tr>
            </thead>

            <tbody>
                <div>
                    <tr>
                       <td>${book.getId()}</td>
                       <td>${book.getName()}</td>
                       <td>${book.getPrice()}</td>
                       <td>${book.getStock()}</td>
                    </tr>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <form method="post" action="/edit/${id}" class="form-inline">
                          <input type="text" name="name" class="form-control" placeholder="book name">
                          <input type="number" name="price" class="form-control" placeholder="price of book">
                          <input type="number" name="stock" class="form-control" placeholder="stock of book">
                          <button type="submit" class="btn btn-primary ml-2">Edit book</button>
                        </form>
                    </div>
                </div>
            </tbody>
        </table>
    </main>

    <footer>
        <!-- Підвал сторінки можна розмістити тут -->
    </footer>
</body>
</html>
