<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Categories page</title>
    <link href="/css/styles.css" rel="stylesheet">
    <script defer src="js/category-edit.js"></script>
    <script defer src="/js/category-delete.js"></script>
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
        <tr><a href="/categories/create-category-page">ADD NEW CATEGORY</a></tr>
    </div>
    <br>
    <table border="2px" id="categoriesTable">
        <thead>
        <tr>
            <th>category id</th>
            <th>name</th>
        </tr>
        </thead>
        <tbody>
        <#list categories as category>
        <tr data-category-id=${category.getId()}>
            <td><a href="/categories/${category.getId()}"><p>${category.getId()}</a></td>
            <td>${category.getName()}</td>
            <td>
                <button onclick="window.location.href = '/categories/${category.id}/edit-category-page'">Edit</button>
            </td>

            <td>
                <button onclick="deleteCategory('${category.id}')">Delete</button>
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
