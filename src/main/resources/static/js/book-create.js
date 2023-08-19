function createBook(event) {
  event.preventDefault();

  //докумен жто страница в виде оьъекта
  //у объекта есть методы, метод getElementById возв элемент(объект) по id(в этом случае это объект
  //инпут тега,
  //.value отдает введенное значение в инпут
  const name = document.getElementById("name").value;
  const authorId = document.getElementById("authorId").value;
  const price = document.getElementById("price").value;
  const stock = document.getElementById("stock").value;

  const requestBody = JSON.stringify({
    name: name,
    authorId: authorId,
    price: price,
    stock: stock
  });

  const url = '/books';

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'POST',
    redirect: 'follow', // default setting
    headers: {
      'Content-Type': 'application/json',
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