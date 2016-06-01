import React from 'react';
import classnames from 'classnames';
import axios from 'axios';


export default class RedisAlert extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {
      prod_status: "",
      dev_status: ""
    };
  }

  componentDidMount() {
    this.props.firebase_db.ref('/component_data').on('value', function(data) {
      data.val()[Object.keys(data.val())[0]].map(function(component_data, i) {
        if (component_data.name == this.constructor.name) {
          this.setState({
            prod_status: (component_data.data.prod_status ? component_data.data.prod_status : "OK!"),
            dev_status: (component_data.data.dev_status ? component_data.data.dev_status : "OK!")
          });
        }
      }.bind(this));
    }.bind(this));
  }

  render() {
    var styleClassHeader = classnames('redis-alert-box-content-header');
    var styleClass = classnames('redis-alert-box',
                                {[`${this.props.config.float}`]: true},
                                {[`width-${this.props.config.width}`]: true},
                                {[`height-${this.props.config.height}`]: true},
                                {['hidden']: (this.state.prod_status == "online" && this.state.dev_status == "online")}
                               );
    return (
      <div className={styleClass}>
        <div className={styleClassHeader}>Redis status</div>
        <div className={styleClassHeader}>Production: {this.state.prod_status}</div>
        <div className={styleClassHeader}>Development: {this.state.dev_status}</div>
      </div>
    );
  }
};
