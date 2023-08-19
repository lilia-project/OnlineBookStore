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
        <section>
            <h2>Create a new book</h2>
                 <form id="createForm" onsubmit="createBook(event)">
                       <label for="name">Book name:</label>
                       <input type="text" id="name" placeholder="name" required>
                       <input type="number" id="price" placeholder="price" required>
                       <input type="number" id="stock" placeholder="stock" required>
                       <button type="submit">Create</button>
                 </form>
        </section>
    </main>

    <footer>
        <!-- Підвал сторінки можна розмістити тут -->
    </footer>

    <script src="/js/book-create.js"></script>
</body>
</html>

