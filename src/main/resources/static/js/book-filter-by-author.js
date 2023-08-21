function filterBookByAuthor() {
  const bookAuthorId = document.getElementById("bookAuthor").value;
  const url = `/books/filter/author?authorId=${bookAuthorId}`;

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