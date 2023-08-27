function createBook(event) {
  event.preventDefault();

  //докумен жто страница в виде оьъекта
  //у объекта есть методы, метод getElementById возв элемент(объект) по id(в этом случае это объект
  //инпут тега,
  //.value отдает введенное значение в инпут
  const name = document.getElementById("name").value;
  const price = document.getElementById("price").value;
  const stock = document.getElementById("stock").value;
  const author = document.getElementById("bookAuthor").value;
  const category = document.getElementById("bookCategory").value;
  const csrf = document.getElementById("_csrf").value;

  const requestBody = JSON.stringify({
    name: name,
    price: price,
    stock: stock,
    author: author,
    category: category
  });

  const url = '/books';

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'POST',
    redirect: 'follow', // default setting
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': csrf,
    },
    body: requestBody,
  })
  .then(response => {
      if (response.redirected) {
         window.location.href = response.url;  // or, location.replace(res.url);
         return;
      }
      else
         return response.text();
  })
  .catch(error => {
      console.error(error);
  })
}