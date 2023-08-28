function deleteAuthor(authorId, csrf) {
  const url = `/authors/${authorId}`;

  // Perform an AJAX request to delete the course
  fetch(url, {
    method: 'DELETE',
    headers: {
         'X-CSRF-TOKEN': csrf,
    },
  })
    .then(response => {

      if (response.status === 200) {
          // Remove the corresponding row from the table
          const row = document.querySelector(`#authorsTable tr[data-author-id="${authorId}"]`);
          if (row) {
            row.remove();
          }
      } else {
          alert("You are not authorized to do this");
      }
    })
    .catch(error => console.error(error));
}