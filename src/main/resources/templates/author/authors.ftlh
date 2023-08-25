<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Authors page</title>
    <link href="/css/styles.css" rel="stylesheet">
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
    <table border="2px" id="authorsTable">
        <thead>
        <tr>
            <th>author id</th>
            <th>name</th>
            <th>surname</th>
        </tr>
        </thead>
        <tbody>
        <#list authors as author>
        <tr data-author-id=${author.getId()}>
            <td><a href="/authors/${author.getId()}"><p>${author.getId()}</a></td>
            <td>${author.getName()}</td>
            <td>${author.getSurname()}</td>
            <td>
                <button onclick="window.location.href = '/authors/${author.id}/edit-author-page'">Edit</button>
            </td>

            <td>
                <button onclick="deleteAuthor('${author.id}')">Delete</button>
            </td>
        </tr>
        </
        #list>
        </tbody>
    </table>
</main>

<footer>
    <!-- Підвал сторінки можна розмістити тут -->
</footer>
</body>
</html>
