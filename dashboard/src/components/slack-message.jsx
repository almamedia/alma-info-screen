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
    this.props.firebase_db.ref('/component_data').on('value', function(data) {
      data.val()[Object.keys(data.val())[0]].map(function(component_data, i) {
        if (component_data.name == this.constructor.name) {
          this.setState({
            current_message: (component_data.data.current_message ? component_data.data.current_message : "Lähetä viesti komennolla: !info [viesti]")
          });
        }
      }.bind(this));
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
