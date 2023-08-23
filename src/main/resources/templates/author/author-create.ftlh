<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Author-create page</title>
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
    <section>
        <h2>Create a new author</h2>
        <form id="createForm" onsubmit="createAuthor(event)">
            <label for="name">Author name:</label>
            <input id="name" placeholder="name" required type="text">
            <label for="surname">Author surname:</label>
            <input id="surname" placeholder="surname" required type="text">

            <button type="submit">Create</button>
        </form>
    </section>
</main>

<footer>
    <!-- Підвал сторінки можна розмістити тут -->
</footer>

<script src="/js/author-create.js"></script>
</body>
</html>

