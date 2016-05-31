import React from 'react';
import classnames from 'classnames';
import $ from 'jquery';
import OwlCarousel from 'react-owl-carousel';
import Page from "./page";
import ReactFireMixin from 'reactfire';
import Firebase from 'firebase';
import reactMixin from 'react-mixin';


export default class Screen extends React.Component {
  constructor(props) {
    super(props);
    var config = {
      apiKey: "AIzaSyBtDpdPlcbb-G5iAtZZOKjMyAKRVjh3l70",
      authDomain: "il-info-screen.firebaseapp.com",
      databaseURL: "https://il-info-screen.firebaseio.com",
      storageBucket: "il-info-screen.appspot.com",
    };
    Firebase.initializeApp(config);
    this.database = Firebase.database();
    this.render = this.render.bind(this);
    this.state = {
      pages: []
    };
  }

  componentWillMount() {
    this.database.ref('/page_config/pages').on('value', function(data) {
      var page_array = [];
      if (data.val() != undefined) {
        Object.keys(data.val()).map(function(page, i) {
          page_array.push(data.val()[page]);
        }.bind(this));
      }
      this.setState({
        pages: page_array
      });
    }.bind(this));
  }

  render() {
    return (
      <OwlCarousel singleItem autoPlay={300000} >
        {this.state.pages.map(function(page_components, i) {
          return <Page key={i} config={page_components} firebase_db={this.database}/>
        }.bind(this))}
      </OwlCarousel>
    );
  }
};
