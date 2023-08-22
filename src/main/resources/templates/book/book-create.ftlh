<#import "../parts/common.ftlh" as c>

<@c.page>
  <!-- Верхній ряд вкладок -->
  <div class="container mt-2">
      <ul class="nav nav-tabs">
          <li class="nav-item">
              <a class="nav-link" href="/index">Home</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="/books">Catalog</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="#">Discounts</a>
          </li>
          <div class="col-md-8">
              <ul class="nav nav-tabs justify-content-end">
                  <li class="nav-item">
                      <a href="#" class="nav-link"><i class="bi bi-heart"></i></a>
                  </li>
              </ul>
          </div>
      </ul>
  </div>
  <br>
  <br>
     <section>
              <form id="createForm" onsubmit="createBook(event)">
                <div class="row">
                     <div class="col-md-3">
                         <label for="name">Book name:</label>
                         <input type="text" id="name" placeholder="name" required>
                     </div>
                     <div class="col-md-3">
                         <label for="price">Book price:</label>
                         <input type="number" id="price" placeholder="price" required>
                     </div>
                    <div class="col-md-3">
                         <label for="stock">Book stock:</label>
                         <input type="number" id="stock" placeholder="stock" required>
                     </div>
                      </div>
                     <button type="submit" class="btn btn-success float-end">Add new book</button>
              </form>
     </section>
</@c.page>

