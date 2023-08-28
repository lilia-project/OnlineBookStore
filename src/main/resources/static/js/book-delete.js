function deleteBook(bookId, csrf) {
  const url = `/books/${bookId}`;

  fetch(url, {
    method: 'DELETE',
     headers: {
          'X-CSRF-TOKEN': csrf,
        },
  })
    .then(response => {

      if (response.status === 200) {
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