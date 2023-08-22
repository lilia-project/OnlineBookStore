<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basket page</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <header>
        <div class="container">
           <div id="branding">
               <h1><span class="highlight">Add to buy</span>store</h1>
           </div>
           <nav>
               <#include "../menu.ftlh">
           </nav>
        </div>
    </header>

    <main>
       <h1>Your Cart</h1>
           <table id="cart-table">
               <thead>
                   <tr>
                       <th>Book ID</th>
                       <th>Name</th>
                       <th>Price</th>
                       <th>Stock</th>
                       <th>Total</th>
                   </tr>
               </thead>
               <tbody id="cart-items">
                   <!-- Тут будуть додаватися позиції замовлення -->
               </tbody>
               <tfoot>
                   <tr>
                       <td colspan="4">Total:</td>
                       <td id="cart-total">0</td>
                   </tr>
               </tfoot>
           </table>
           <button id="checkout-btn">Checkout</button>

           <script>
               // Додайте тут логіку з JavaScript, як показано в попередніх відповідях.
           </script>

    <footer>
        <!-- Підвал сторінки можна розмістити тут -->
    </footer>
</body>
</html>
