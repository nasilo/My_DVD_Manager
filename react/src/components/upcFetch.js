upcFetch(upcCode) {
  let data = {
      upc: review.id,
    }
    let jsonStringData = JSON.stringify(data);
  fetch(`/api/v1/upcs`, {
    credentials: 'same-origin',
    method: 'post',
    headers: { 'Content-Type': 'application/json' },
    body: jsonStringData
  })
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
      error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(body => {
    debugger;
    let newUsers = body.users;
    this.setState({
      users: newUsers,
    });
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}


export default upcFetch;
