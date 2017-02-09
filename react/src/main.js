import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import NewDvdApp from './components/NewDvdApp';

$(function() {
  if (document.getElementById('test')) {
    ReactDOM.render(
      < NewDvdApp />,
      document.getElementById('new_dvd')
    );
  }
});
