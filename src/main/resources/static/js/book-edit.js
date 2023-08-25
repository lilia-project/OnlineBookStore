function editBook(event, bookId) {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const price = document.getElementById("price").value;
  const stock = document.getElementById("stock").value;
  const csrf = document.getElementById("_csrf").value;

   const requestBody = JSON.stringify({
      name: name,
      price: price,
      stock: stock
    });

  const url = `/books/${bookId}`;

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': csrf,
    },
    body: requestBody,
  })
  .then(response => {
      window.location.href = `/books/${bookId}`;
  })
  .catch(error => {
      console.error(error);
  })
}