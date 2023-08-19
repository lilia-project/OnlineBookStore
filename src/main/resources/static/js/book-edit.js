function editBook(event, bookId) {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const price = document.getElementById("price").value;
  const stock = document.getElementById("stock").value;

   const requestBody = JSON.stringify({
      name: name,
      price: price,
      stock: stock
    });

  const url = `/books/${bookId}`;

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
    },
    body: requestBody,
  })
  .then(response => {
      window.location.href = `/students/${studentId}`;
  })
  .catch(error => {
      console.error(error);
  })
}