function addBookToBasket(event, bookId) {
  event.preventDefault();

  const url = `/basket/item?bookId=${bookId}`;

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'POST',
    redirect: 'follow', // default setting
    headers: {
      'Content-Type': 'application/json',
    },

  })
  .then(response => {
      if (response.redirected) {
         window.location.href = response.url;  // or, location.replace(res.url);
         return;
      }
      else
         return response.text();
  })
  .catch(error => {
      console.error(error);
  })
}