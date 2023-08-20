<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category-edit page</title>
     <link rel="stylesheet" href="../styles.css">
     <script defer src="js/category-edit.js"></script>

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
        <tbody>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <form id="editForm" onsubmit="editCategory(event, '${category.id}')">
                        <label for="name">Name: <span aria-label="required">*</span></label>
                        <input type="text" id="name" value="${category.name}" required>
                        
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
