function editAuthor(event, authorId) {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const price = document.getElementById("surname").value;

   const requestBody = JSON.stringify({
      name: name,
      surname: surname,
    });

  const url = `/authors/${authorId}`;

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
    },
    body: requestBody,
  })
  .then(response => {
      window.location.href = `/authors/${authorId}`;
  })
  .catch(error => {
      console.error(error);
  })
}