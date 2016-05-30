import React from "react";
import ReactDOM from 'react-dom';
import axios from 'axios';
import $ from 'jquery';
import OwlCarousel from 'react-owl-carousel';
import Screen from "./components/screen";

require('./stylesheets/main.scss');

axios.get('http://ankkuri.dev:3000/config')
.then(function (response) {
  ReactDOM.render(
    <Screen config={response}/>,
    document.querySelector('.screen-component')
  );
})
