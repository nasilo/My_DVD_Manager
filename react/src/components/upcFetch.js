upcFetch(upcCode) {
  let data = {
      upc: upcCode
    };
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
    let newUpcId = body.upc.id;
    let newDvdTitle = body.dvd.title;
    let newDvdMpaaRating = body.dvd.mpaa_rating;
    let newDvdSynopsis = body.dvd.synopsis;
    let newDvdStudio = body.dvd.studio;
    let newDvdCast = body.dvd.cast;
    let newDvdWriter = body.dvd.writer;
    let newDvdProducer = body.dvd.producer;
    let newDvdDirector = body.dvd.director;
    let newDvdReleaseDate = body.dvd.release_date;
    let newDvdRunTime = body.dvd.run_time;
    this.setState({
      upcId: newUpcId,
      dvdTitle: newDvdTitle,
      dvdMpaaRating: newDvdMpaaRating,
      dvdSynopsis: newDvdSynopsis,
      dvdStudio: newDvdStudio,
      dvdCast: newDvdCast,
      dvdWriter: newDvdWriter,
      dvdProducer: newDvdProducer,
      dvdDirector: newDvdDirector,
      dvdReleaseDate: newDvdReleaseDate,
      dvdRunTime: newDvdRunTime,
      });
    })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
}

export default upcFetch;
