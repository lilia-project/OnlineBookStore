function deleteAuthor(authorId) {
  const url = `/authors/${authorId}`;

  fetch(url, {
    method: 'DELETE',
  })
    .then(response => {

      if (response.status === 200) {
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