function addBookToBasket(event, bookId, csrf) {
  event.preventDefault();

  const url = `/basket/item?bookId=${bookId}`;

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'POST',
    redirect: 'follow', // default setting
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': csrf,
    },

  })
  .then(response => {
    document.getElementById("book-wish-listed-alert").classList.remove('d-none');
      if (response.redirected) {
         window.location.href = response.url;  // or, location.replace(res.url);
         return;
      }
  })
  .catch(error => {
      console.error(error);
  })
}