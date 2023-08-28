function editAuthor(event, authorId) {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const surname = document.getElementById("surname").value;
  const csrf = document.getElementById("_csrf").value;

   const requestBody = JSON.stringify({
      name: name,
      surname: surname
    });

  const url = `/authors/${authorId}`;

  fetch(url, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': csrf,
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