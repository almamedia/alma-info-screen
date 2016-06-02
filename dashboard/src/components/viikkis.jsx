import React from 'react';
import classnames from 'classnames';

export default class Viikkis extends React.Component {
  render() {
    var styleClass = classnames({'viikkis-box': true},
                                {[`${this.props.config.float}`]: true},
                                {[`width-${this.props.config.width}`]: true},
                                {[`height-${this.props.config.height}`]: true}
                               );
    return (
      <div className={styleClass}>
        {this.props.data.tiedottaja}
      </div>
    );
  }
};
