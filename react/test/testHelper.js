import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import ReactTestUtils from 'react-addons-test-utils';
import createResponseFromFixture from './support/createResponseFromFixture';
import createNoContentResponse from './support/createNoContentResponse';
import simulateIfPresent from './support/simulateIfPresent';
import fillIn            from './support/fillIn';
import clickSubmit       from './support/clickSubmit';
import clickButton       from './support/clickButton';
import select            from './support/select';
import clickOn           from './support/clickOn';
import $ from 'jquery';
import 'jasmine-ajax';

Object.assign(global, {
  createNoContentResponse,
  createResponseFromFixture,
  jasmineEnzyme,
  mount,
  React,
  shallow,
  simulateIfPresent,
  fillIn,
  clickSubmit,
  clickButton,
  select,
  clickOn,
  $
});

beforeEach(() => {
  jasmineEnzyme();
});

afterEach(() => {
  if(global.page) { global.page.unmount(); }
});

// function to require all modules for a given context
let requireAll = requireContext => {
  requireContext.keys().forEach(requireContext);
};

// require all js files except testHelper.js in the test folder
requireAll(require.context('./', true, /^((?!testHelper).)*\.jsx?$/));

// require all js files except main.js in the src folder
requireAll(require.context('../src/', true, /^((?!main).)*\.jsx?$/));

// output to the browser's console when the tests run
console.info(`TESTS RAN AT ${new Date().toLocaleTimeString()}`);
