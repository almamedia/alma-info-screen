import React from "react";
import ReactDOM from 'react-dom';
import axios from 'axios';
import $ from 'jquery';
import OwlCarousel from 'react-owl-carousel';
import Screen from "./components/screen";

require('./stylesheets/main.scss');

ReactDOM.render(
  <Screen />,
  document.querySelector('.screen-component')
);
