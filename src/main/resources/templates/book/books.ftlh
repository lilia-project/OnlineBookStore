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
         <div class="container">
             <a href="/books/create-book-page" class="btn btn-success btn-sm">ADD NEW BOOK</a>
             <select id="bookCategory" class="form-select mt-2">
                 <#list categories as category>
                     <option value="${category.id}">${category.name}</option>
                 </#list>
             </select>
             <button onclick="filterBook()" class="btn btn-primary mt-2">FILTER BY GENRE</button>
             <button onclick="filterBookByAuthor()" class="btn btn-primary mt-2">SEARCH BY AUTHOR</button>
         </div>
         <table class="table border="2px" id = "booksTable" table-light table-striped mt-7>
                    <thead>
                      <tr>
                          <th>book id</th>
                          <th>name</th>
                          <th>price</th>
                          <th>stock</th>
                      </tr>
                    </thead>
                    <tbody>
                         <#list books as book>
                             <tr data-book-id = ${book.getId()}>
                                 <td><a href="/books/${book.getId()}"><p>${book.getId()}</a></td>
                                 <td>${book.getName()}</td>
                                 <td>${book.price!'-'}</td>
                                 <td>${book.stock!'-'}</td>
                                 <td><button onclick="buyBook('${book.id}')" class="btn btn-success btn-sm">Buy</button></td>
                                 <td><button onclick="window.location.href = '/books/${book.id}/edit-book-page'" class="btn btn-primary btn-sm">Edit</button></td>
                                 <td><button onclick="deleteBook('${book.id}')" class="btn btn-primary btn-sm">Delete</button></td>

                             </tr>
                         </#list>
                    </tbody>
                 </table>


</@c.page>



