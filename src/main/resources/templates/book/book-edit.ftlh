<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Book-edit page</title>
    <link href="/styles.css" rel="stylesheet">
    <script defer src="/js/book-edit.js"></script>

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
    <tbody>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form id="editForm" onsubmit="editBook(event, '${book.id}')">
                <label for="name">Name: <span aria-label="required">*</span></label>
                <input id="name" required type="text" value="${book.name}">
                <label for="name">Book price: <span aria-label="required">*</span></label>
                <input id="price" required type="number" value="${book.price}">
                <label for="name">Book stock: <span aria-label="required">*</span></label>
                <input id="stock" required type="number" value="${book.stock}">

                <input class="button" type="submit" value="Update">
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
