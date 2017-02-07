import React, { Component } from 'react';

class NewDvdApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: false,
      upcCode: '',
      upcId: null,
      dvdTitle: '',
      dvdMpaaRating: '',
      dvdSynopsis: '',
      dvdStudio: '',
      dvdCast: '',
      dvdWriter: '',
      dvdProducer: '',
      dvdDirector: '',
      dvdReleaseDate: '',
      dvdRunTime: ''
    };
    
  }

}

export default NewDvdApp;
