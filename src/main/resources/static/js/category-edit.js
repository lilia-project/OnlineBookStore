function editCategory(event, categoryId) {
  event.preventDefault();

  const name = document.getElementById("name").value;

   const requestBody = JSON.stringify({
      name: name
    });

  const url = `/categories/${categoryId}`;

  // Perform an AJAX request to create a new category
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