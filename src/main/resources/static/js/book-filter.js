function searchBooks() {
  const bookCategoryId = document.getElementById("bookCategory").value;
  const bookAuthorId = document.getElementById("bookAuthor").value;
  const bookTitle = document.getElementById("bookTitle").value;
  const bookSort = document.getElementById("bookSort").value;

  const url = `/books?authorId=${bookAuthorId}&categoryId=${bookCategoryId}&bookTitle=${bookTitle}&bookSort=${bookSort}`;

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