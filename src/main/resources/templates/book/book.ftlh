<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Empty Page</title>
    <link href="../styles.css" rel="stylesheet">
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
        </tbody>
    </table>
    <div>
        <tr><a href="/basket">BUY</a></tr>
    </div>
</main>

<footer>
    <!-- Підвал сторінки можна розмістити тут -->
</footer>
</body>
</html>
