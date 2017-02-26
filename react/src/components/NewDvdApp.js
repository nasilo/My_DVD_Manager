import React, { Component } from 'react';
import UpcForm from './UpcForm';
import DvdForm from './DvdForm';

class NewDvdApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: false,
      errorMessage: '',
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
      dvdUserRating: '',
      userId: null
    };
    this.handleUpcSubmit = this.handleUpcSubmit.bind(this);
    this.handleChangeUpc = this.handleChangeUpc.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleDvdSubmit = this.handleDvdSubmit.bind(this);
  }

  componentDidMount() {
    let newUserId = parseInt($('.dvd-content').first().attr("id"));
    this.setState({userId: newUserId});
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
      let newError = body.error.state;
      let newErrorMessage = body.error.message;
      this.setState({
        error: newError,
        errorMessage: newErrorMessage,
        upcId: newUpcId,
        upcCode: newUpcCode,
        dvdTitle: (newDvdTitle) ? newDvdTitle : '',
        dvdMpaaRating: (newDvdMpaaRating) ? newDvdMpaaRating : '',
        dvdSynopsis: (newDvdSynopsis) ? newDvdSynopsis : '',
        dvdStudio: (newDvdStudio) ? newDvdStudio : '',
        dvdCast: (newDvdCast) ? newDvdCast : '',
        dvdWriter: (newDvdWriter) ? newDvdWriter : '',
        dvdProducer: (newDvdProducer) ? newDvdProducer : '',
        dvdDirector: (newDvdDirector) ? newDvdDirector : '',
        dvdReleaseDate: (newDvdReleaseDate) ? newDvdReleaseDate : '',
        dvdRunTime: (newDvdRunTime) ? newDvdRunTime : '',
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleChangeUpc(event) {
    this.setState({upcCode: event.target.value});
  }

  handleDvdSubmit(event) {
    event.preventDefault();
    let data = {
        dvd: {
          upc_id: this.state.upcId,
          title: this.state.dvdTitle,
          purchase_price: this.state.dvdPurchasePrice,
          purchase_location: this.state.dvdPurchaseLocation,
          user_rating: this.state.dvdUserRating,
          mpaa_rating: this.state.dvdMpaaRating,
          synopsis: this.state.dvdSynopsis,
          studio: this.state.dvdStudio,
          cast: this.state.dvdCast,
          writer: this.state.dvdWriter,
          producer: this.state.dvdProducer,
          director: this.state.dvdDirector,
          release_date: this.state.dvdReleaseDate,
          run_time: this.state.dvdRunTime
        }
      };
      let jsonStringData = JSON.stringify(data);
    fetch('/api/v1/dvds', {
      credentials: 'same-origin',
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: jsonStringData
    })
    .then(response => {
      if (response.url.includes('api/v1/dvds')) {
        return response;
      } else if (response.ok) {
        window.location.replace(response.url);
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
      let newError = body.error.state;
      let newErrorMessage = body.error.message;
      this.setState({
        error: newError,
        errorMessage: newErrorMessage,
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

  handleInputChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;

    this.setState({
      [name]: value
    });
  }

  render() {
    let message = null;
    if (this.state.error) {
      message = <p>{this.state.errorMessage}</p>
    } else {
      message = <div className="hidden"></div>
    }
    return(
      <div>
        <UpcForm
          handleUpcSubmit={this.handleUpcSubmit}
          handleChangeUpc={this.handleChangeUpc}
          upcCode={this.state.upcCode}
        />
        { message }
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
          userId={this.state.userId}
          handleInputChange={this.handleInputChange}
          handleDvdSubmit={this.handleDvdSubmit}
        />
      </div>
    )
  }
};

export default NewDvdApp;
