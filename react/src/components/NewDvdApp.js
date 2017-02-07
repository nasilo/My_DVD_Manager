import React, { Component } from 'react';
import upcFetch from './upcFetch';

class NewDvdApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: false,
      upcCode: null,
      upcId: null,
      dvdTitle: null,
      dvdMpaaRating: null,
      dvdSynopsis: null,
      dvdStudio: null,
      dvdCast: null,
      dvdWriter: null,
      dvdProducer: null,
      dvdDirector: null,
      dvdReleaseDate: null,
      dvdRunTime: null,
      dvdPurchasePrice: null,
      dvdPurchaseLocation: null,
      dvdUserRating: null
    };
    this.handleUpcSubmit = this.handleUpcSubmit.bind(this);
  }

  handleUpcSubmit() {
    upcFetch(this.state.upcCode)
  }

  handleChangeUpc(event) {
    this.setState({upcCode: event.target.value});
  }

  render() {
    return(
      <div>
        <UpcForm
          onSubmit={this.handleUpcSubmit}
          onChange={this.handleChangeUpc}
          upcCode={this.state.upcCode}
        />
      </div>
    )
  }
}

export default NewDvdApp;
