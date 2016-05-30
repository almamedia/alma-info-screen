import React from 'react';
import classnames from 'classnames';
import $ from 'jquery';
import OwlCarousel from 'react-owl-carousel';
import Page from "./page";

export default class Screen extends React.Component {

  render() {
    return (
      <OwlCarousel singleItem autoPlay={300000} >
        {this.props.config.data.map(function(page_config, i) {
          return <Page key={i} config={page_config} />
        })}
      </OwlCarousel>
    );
  }
};
