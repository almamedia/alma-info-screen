import React from 'react';
import classnames from 'classnames';

export default class RedisAlert extends React.Component {
  render() {
    var styleClassHeader = classnames('redis-alert-box-content-header');
    var styleClass = classnames('redis-alert-box',
                                {[`${this.props.config.float}`]: true},
                                {[`width-${this.props.config.width}`]: true},
                                {[`height-${this.props.config.height}`]: true},
                                {['hidden']: (this.props.data.prod_status == "online" && this.props.data.dev_status == "online")}
                               );
    return (
      <div className={styleClass}>
        <div className={styleClassHeader}>Redis status</div>
        <div className={styleClassHeader}>Production: {this.props.data.prod_status}</div>
        <div className={styleClassHeader}>Development: {this.props.data.dev_status}</div>
      </div>
    );
  }
};
