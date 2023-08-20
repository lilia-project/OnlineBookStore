<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category page</title>
    <link rel="stylesheet" href="../styles.css">
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
