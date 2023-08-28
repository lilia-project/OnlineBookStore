function createAuthor(event) {
  event.preventDefault();

  const name = document.getElementById("name").value;
  const surname = document.getElementById("surname").value;
  const csrf = document.getElementById("_csrf").value;

  const requestBody = JSON.stringify({
    name: name,
    surname: surname
  });

  const url = '/authors';

  fetch(url, {
    method: 'POST',
    redirect: 'follow',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': csrf,
    },
    body: requestBody,
  })
  .then(response => {
      if (response.redirected) {
         window.location.href = response.url;
         return;
      }
      else
         return response.text();
  })
  .catch(error => {
      console.error(error);
  })
}