<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Author page</title>
    <link href="../styles.css" rel="stylesheet">
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1><span class="highlight">Author</span>store</h1>
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
            <th>author id</th>
            <th>name</th>
            <th>surname</th>
        </tr>
        </thead>

        <tbody>
        <div>
            <tr>
                <td>${author.getId()}</td>
                <td>${author.getName()}</td>
                <td>${author.getSurname()}</td>
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
