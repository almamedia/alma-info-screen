import React from 'react';
import classnames from 'classnames';
import $ from 'jquery';
import SlackMessage from './slack-message';
import RedisAlert from './redis-alert';
import Viikkis from './viikkis';

const pageComponentList = {
  SlackMessage,
  RedisAlert,
  Viikkis
};

export default class Page extends React.Component {
  constructor(props) {
    super(props);
    this.render = this.render.bind(this);
    this.state = {
      all_component_data: []
    }
  }

  componentWillMount() {
    this.props.firebase_db.ref('/component_data').on('value', function(data) {
      var component_data_array = []
      Object.keys(data.val()).map(function(component_object, i) {
        component_data_array.push(data.val()[component_object]);
      })
      this.setState({
        all_component_data: component_data_array
      });
    }.bind(this));
  }

  render() {
    var styleClass = classnames({'page': true});
    var activeComponents = [];
    Object.keys(this.props.config.components).map(function(component, i) {
      this.state.all_component_data.map(function(component_data, i) {
        if (this.props.config.components[component].name == component_data.name) {
          activeComponents.push({id: pageComponentList[this.props.config.components[component].name], config: this.props.config.components[component], data: component_data.data});
        }
      }.bind(this))
    }.bind(this));
    return (
      <div className={styleClass}>
        {activeComponents.map(function(Component, i) {
          return <Component.id key={i} config={Component.config} data={Component.data} firebase_db={this.props.firebase_db} />
        }.bind(this))}
      </div>
    );
  }
};
