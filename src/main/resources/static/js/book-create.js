function createBook(event) {
  event.preventDefault();

  const name = document.getElementById("name").value;//докумен жто страница в виде оьъекта
  //у объекта есть методы, метод getElementById возв элемент(объект) по id(в этом случае это объект
  //инпут тега,
  //.value отдает введенное значение в инпут

  const requestBody = JSON.stringify({
    name: name,
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