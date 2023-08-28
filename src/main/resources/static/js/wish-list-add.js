function showWishListAlert(bookId, csrf) {
    const url = `/wishlist/item?bookId=${bookId}`;

    fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': csrf,
        },
    })
    .then(response => {
        if (response.status === 200) {
            const element = document.querySelector(`#booksTable tr[data-book-id="${bookId}"] td i`);
            element.classList.remove('bi-heart');
            element.classList.add('bi-heart-fill');
        } else {
            alert("Something went wrong! Try again later");
        }
    })
    .catch(error => console.error(error));
}