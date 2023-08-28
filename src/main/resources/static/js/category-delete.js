function deleteCategory(categoryId, csrf) {
  const url = `/categories/${categoryId}`;

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
          const row = document.querySelector(`#categoriesTable tr[data-category-id="${categoryId}"]`);
          if (row) {
            row.remove();
          }
      } else if(response.status === 409){
          alert("This category is referenced by a book. You need to delete this book firstly.");
      }
      else {
          alert("You are not authorized to do this");
      }
    })
    .catch(error => console.error(error));
}