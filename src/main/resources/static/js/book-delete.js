function deleteBook(bookId) {
  const url = `/books/${bookId}`;

  // Perform an AJAX request to delete the course
  fetch(url, {
    method: 'DELETE',
  })
    .then(response => {

      if (response.status === 200) {
          // Remove the corresponding row from the table
          const row = document.querySelector(`#booksTable tr[data-book-id="${bookId}"]`);
          if (row) {
            row.remove();
          }
      } else {
          alert("You are not authorized to do this");
      }
    })
    .catch(error => console.error(error));
}