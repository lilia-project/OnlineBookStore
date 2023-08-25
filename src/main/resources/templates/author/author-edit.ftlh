<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Author-edit page</title>
    <link href="/css/styles.css" rel="stylesheet">
    <script defer src="/js/author-edit.js"></script>

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
    <tbody>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form id="editForm" onsubmit="editAuthor(event, '${author.id}')">
                <label for="name">Name: <span aria-label="required">*</span></label>
                <input id="name" required type="text" value="${author.name}">
                <label for="name">Surname: <span aria-label="required">*</span></label>
                <input id="surname" required type="text" value="${author.surname}">
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
