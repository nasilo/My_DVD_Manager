import React, { Component } from 'react';
import UpcForm from './UpcForm';
import DvdForm from './DvdForm';

class NewDvdApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: false,
      upcCode: '',
      upcId: '',
      dvdTitle: '',
      dvdMpaaRating: '',
      dvdSynopsis: '',
      dvdStudio: '',
      dvdCast: '',
      dvdWriter: '',
      dvdProducer: '',
      dvdDirector: '',
      dvdReleaseDate: '',
      dvdRunTime: '',
      dvdPurchasePrice: '',
      dvdPurchaseLocation: '',
      dvdUserRating: ''
    };
    this.handleUpcSubmit = this.handleUpcSubmit.bind(this);
    this.handleChangeUpc = this.handleChangeUpc.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleUpcSubmit(event) {
    event.preventDefault();
    let data = {
        upc: this.state.upcCode
      };
      let jsonStringData = JSON.stringify(data);
    fetch('/api/v1/upcs', {
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
      let newUpcId = body.upc.id;
      let newUpcCode = body.upc.upc;
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
        upcCode: newUpcCode,
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

  handleChangeUpc(event) {
    this.setState({upcCode: event.target.value})
  }

  handleInputChange(event) {
    let target = event.target;
    let value = target.value;
    let name = target.name;

    this.setState({
      [name]: value
    });
  }

  render() {
    return(
      <div>
        <UpcForm
          handleUpcSubmit={this.handleUpcSubmit}
          handleChangeUpc={this.handleChangeUpc}
          upcCode={this.state.upcCode}
        />
        <DvdForm
          dvdTitle={this.state.dvdTitle}
          dvdMpaaRating={this.state.dvdMpaaRating}
          dvdSynopsis={this.state.dvdSynopsis}
          dvdStudio={this.state.dvdStudio}
          dvdCast={this.state.dvdCast}
          dvdWriter={this.state.dvdWriter}
          dvdProducer={this.state.dvdProducer}
          dvdDirector={this.state.dvdDirector}
          dvdReleaseDate={this.state.dvdReleaseDate}
          dvdRunTime={this.state.dvdRunTime}
          dvdPurchasePrice={this.state.dvdPurchasePrice}
          dvdPurchaseLocation={this.state.dvdPurchaseLocation}
          dvdUserRating={this.state.dvdUserRating}
          handleInputChange={this.handleInputChange}
        />
      </div>
    )
  }
};

export default NewDvdApp;
