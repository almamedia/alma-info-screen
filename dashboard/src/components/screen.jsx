import React from 'react';
import classnames from 'classnames';
import $ from 'jquery';
import OwlCarousel from 'react-owl-carousel';
import Page from "./page";
import ReactFireMixin from 'reactfire';
import Firebase from 'firebase';
import reactMixin from 'react-mixin';


export default class Screen extends React.Component {

  render() {
    var config = {
      apiKey: "AIzaSyBtDpdPlcbb-G5iAtZZOKjMyAKRVjh3l70",
      authDomain: "il-info-screen.firebaseapp.com",
      databaseURL: "https://il-info-screen.firebaseio.com",
      storageBucket: "il-info-screen.appspot.com",
    };
    Firebase.initializeApp(config);
    var database = Firebase.database();
    return (
      <OwlCarousel singleItem autoPlay={300000} >
        {Object.keys(this.props.config.data.page_config.pages).map(function(page, i) {
          return <Page key={i} config={this.props.config.data.page_config.pages[page]} firebase_db={database}/>
        }.bind(this))}
      </OwlCarousel>
    );
  }
};
