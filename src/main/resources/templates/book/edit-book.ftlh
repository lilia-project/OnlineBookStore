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
        <!-- Основний вміст сторінки буде тут -->


                <tbody>
                 ${book}

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form method="post" action="/edit/${id}" class="form-inline">
                                <input type="text" name="name" class="form-control" placeholder="book name">
                                <input type="number" name="price" class="form-control" placeholder="price of tree">

                                <button type="submit" class="btn btn-primary ml-2">Edit new book</button>
                            </form>
                        </div>
                    </div>

                </tbody>

    </main>

    <footer>
        <!-- Підвал сторінки можна розмістити тут -->
    </footer>
</body>
</html>
