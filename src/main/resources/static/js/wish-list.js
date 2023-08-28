function saveOrDeleteWishListItem(bookId, csrf) {
    const url = `/wishlist/item?bookId=${bookId}`;

    const element = document.querySelector(`#booksTable tr[data-book-id="${bookId}"] td i`);

    if (element.classList.contains('bi-heart')) {
        saveItem(url, csrf, element);
    } else if (element.classList.contains('bi-heart-fill')) {
        deleteItem(url, csrf, element);
    } else {
        console.log('Missing expected class (either bi-heart or bi-heart-fill) for "i" element');
    }
}

function saveItem(url, csrf, iconElement) {
    fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': csrf,
        },
    })
    .then(response => {
        if (response.status === 201) {
            // fill the icon of heart
            iconElement.classList.remove('bi-heart');
            iconElement.classList.add('bi-heart-fill');
        } else {
            alert("Something went wrong! Try again later");
        }
    })
    .catch(error => console.error(error));
}

function deleteItem(url, csrf, iconElement) {
    fetch(url, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': csrf,
        },
    })
    .then(response => {
        if (response.status === 200) {
            // fill the icon of heart
            iconElement.classList.remove('bi-heart-fill');
            iconElement.classList.add('bi-heart');
        } else {
            alert("Something went wrong! Try again later");
        }
    })
    .catch(error => console.error(error));
}

function deleteFromBasket(event, bookId, csrf) {
  event.preventDefault();

  const url = `/wishlist/item?bookId=${bookId}`;

  // Perform an AJAX request to create a new student
  fetch(url, {
    method: 'DELETE',
    redirect: 'follow', // default setting
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': csrf,
    },

  })
  .then(response => {
    if (response.status === 200) {
        // Remove the corresponding row from the table
        const row = document.querySelector(`#wishlist-table tr[data-book-id="${bookId}"]`);
        if (row) {
          row.remove();
        }
    } else {
        alert("Something went wrong! Try again later");
    }
  })
  .catch(error => {
      console.error(error);
  })
}

function addBookToBasketFromWishList(event, bookId, csrf) {
    event.preventDefault();

    const url = `/basket/item?bookId=${bookId}&removeFromWishList=true`;

    fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': csrf,
        },
    })
    .then(response => {
        if (response.status === 201) {
            // Remove the corresponding row from the table
            const row = document.querySelector(`#wishlist-table tr[data-book-id="${bookId}"]`);
            if (row) {
              row.remove();
            }
        } else {
            alert("Something went wrong! Try again later");
        }
    })
    .catch(error => console.error(error));
}