function createCategory(event) {
  event.preventDefault();

  const name = document.getElementById("name").value;

  const requestBody = JSON.stringify({
    name: name
  });

  const url = '/categories';

  fetch(url, {
    method: 'POST',
    redirect: 'follow',
    headers: {
      'Content-Type': 'application/json',
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