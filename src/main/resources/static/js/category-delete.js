function deleteCategory(categoryId) {
  const url = `/categories/${categoryId}`;

  // Perform an AJAX request to delete the course
  fetch(url, {
    method: 'DELETE',
  })
    .then(response => {

      if (response.status === 200) {
          // Remove the corresponding row from the table
          const row = document.querySelector(`#categoriesTable tr[data-category-id="${categoryId}"]`);
          if (row) {
            row.remove();
          }
      } else {
          alert("You are not authorized to do this");
      }
    })
    .catch(error => console.error(error));
}