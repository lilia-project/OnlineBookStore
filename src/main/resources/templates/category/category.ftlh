<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Category page</title>
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1><span class="highlight">Category</span>store</h1>
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
            <th>category id</th>
            <th>name</th>
        </tr>
        </thead>

        <tbody>
        <div>
            <tr>
                <td>${category.getId()}</td>
                <td>${category.getName()}</td>
            </tr>
        </div>

        </tbody>
    </table>
</main>

<footer>
    <!-- Підвал сторінки можна розмістити тут -->
</footer>
</body>
</html>
