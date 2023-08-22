<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Website</title>
    <!-- Підключення стилів Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        /* Стилізація зеленого кольору */
        body {
            background-color: #f2f2f2;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            background-color: #5cb85c;
        }
        .btn-primary {
            background-color: #5cb85c;
            border-color: #5cb85c;
        }
        /* Додаткові стилі для реєстрації та логіну */
        .login-register {
            text-align: right;
        }
        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            padding: 10px 0;
            text-align: center;
        }
        /* Зміна стилю для назви магазину "Bookstore" */
        .navbar-brand.custom-font {
            font-family: 'Arial', sans-serif; /* Замініть на власний шрифт */
            font-size: 30px; /* Збільшений розмір шрифту */
            font-weight: bold; /* Товщина шрифту */
        }
        /* Зміна стилю для "Register" */
        .login-register .text-white {
            font-size: 14px; /* Розмір шрифту */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand text-white custom-font">LETTER <img src="/book.jpeg" class="mr-2" width="30" height="30"></a>
            <div class="login-register">
                <a href="#" class="text-white">Login</a> | <a href="#" class="text-white">Logout</a><br>
                <a href="#" class="text-white">Register</a>
            </div>
        </div>
    </nav>

        <!-- Додатковий ряд вкладок -->
        <div class="container mt-2 small-tabs">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link" href="#">Delivery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Payment</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Return Policy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-cart"></i></a>
                </li>
            </ul>
        </div>

    <!-- Верхній ряд вкладок -->
    <div class="container mt-2">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Catalog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Discounts</a>
            </li>
        </ul>
    </div>



    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8">
                <h2>Welcome to our bookstore!</h2>
                <p>We offer a wide range of books for all genres and interests.</p>
            </div>
            <div class="col-md-4">
                <ul class="nav nav-tabs justify-content-end">
                    <li class="nav-item">
                        <a href="#" class="nav-link"><i class="bi bi-heart"></i></a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <h3>Popular Books</h3>
                <ul class="list-group">
                    <li class="list-group-item">Book 1</li>
                    <li class="list-group-item">Book 2</li>
                    <li class="list-group-item">Book 3</li>
                </ul>
            </div>
            <div class="col-md-6">
                <h3>Featured Authors</h3>
                <ul class="list-group">
                    <li class="list-group-item">Author 1</li>
                    <li class="list-group-item">Author 2</li>
                    <li class="list-group-item">Author 3</li>
                </ul>
            </div>
        </div>
    </div>

    <footer class="mt-4 py-2 bg-light footer">
             <div class="container text-center">
                 <p>&copy; 2023 Bookstore. All rights reserved.</p>
             </div>
         </footer>

         <!-- Підключення скриптів Bootstrap та jQuery -->
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
     </body>
     </html>
