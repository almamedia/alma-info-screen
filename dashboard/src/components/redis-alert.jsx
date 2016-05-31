import React from 'react';
import classnames from 'classnames';
import axios from 'axios';


export default class RedisAlert extends React.Component {

  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {
      product_name: "",
    };
  }

  componentDidMount() {
    /*axios.get('https://stripe-dev.iltalehti.fi/api/v2/products')
    .then(function (response) {
      this.setState({
          product_name: response.data.products[0].name
      });
    }.bind(this));*/
  }

  render() {
    var styleClass = classnames('redis-alert-box',
                                {[`width-${this.props.config.width}`]: true},
                                {[`height-${this.props.config.height}`]: true}
                               );
    return (
      <div className={styleClass}>
        Redis says Hello! {this.state.product_name}
      </div>
    );
  }

};
