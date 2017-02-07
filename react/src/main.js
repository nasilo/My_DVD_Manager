import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import NewDvdApp from './components/NewDvdApp';

$(function() {
  ReactDOM.render(
    < NewDvdApp />,
    document.getElementById('app')
  );
});
