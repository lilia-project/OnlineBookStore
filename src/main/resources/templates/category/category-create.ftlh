<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Category-create page</title>
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
    <section>
        <h2>Create a new category</h2>
        <form id="createForm" onsubmit="createCategory(event)">
            <label for="name">Category name:</label>
            <input id="name" placeholder="name" required type="text">

            <button type="submit">Create</button>
        </form>
    </section>
</main>

<footer>
    <!-- Підвал сторінки можна розмістити тут -->
</footer>
<script src="/js/category-create.js"></script>
</body>
</html>

