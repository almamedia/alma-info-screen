import React from 'react';
import classnames from 'classnames';

export default class SlackMessage extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {
      current_message: "Lähetä viesti komennolla: !info [viesti]"
    };
  }

  componentWillMount() {
    this.props.firebase_db.ref('/component_data/-KJ0DIhYZD0CYJiWjbhV/0/data/current_message').on('value', function(data) {
      if (data.val() != undefined) {
        this.setState({
          current_message: data.val()
        });
      } else {
        this.setState({
          current_message: "Lähetä viesti komennolla: !info [viesti]"
        });
      }
    }.bind(this));
  }

  render() {
    var styleClass = classnames({'slack-message-box': true});
    return (
      <div className={styleClass}>
        {this.state.current_message}
      </div>
    );
  }
};
