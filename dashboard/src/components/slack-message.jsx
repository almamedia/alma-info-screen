import React from 'react';
import classnames from 'classnames';


export default class SlackMessage extends React.Component {
  render() {
    var styleClass = classnames({'slack-message-box': true});
    return (
      <div className={styleClass}>
        Slack says Hello!
      </div>
    );
  }
};
