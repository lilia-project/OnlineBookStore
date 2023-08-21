function filterBook() {
  const bookCategoryId = document.getElementById("bookCategory").value;
  const url = `/books/filter?categoryId=${bookCategoryId}`;

  // Perform an AJAX request to delete the course
  fetch(url, {
    method: 'GET',
  })
    .then(response => {
     return response.text();
    })
    .then((html) => {
        document.body.innerHTML = html;
      })
    .catch(error => console.error(error));
}