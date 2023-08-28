function editCategory(event, categoryId) {
  event.preventDefault();

  const name = document.getElementById("name").value;

   const requestBody = JSON.stringify({
      name: name
    });

  const url = `/categories/${categoryId}`;

  fetch(url, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: requestBody,
  })
  .then(response => {
      window.location.href = `/categories/${categoryId}`;
  })
  .catch(error => {
      console.error(error);
  })
}