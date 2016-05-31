import React from 'react';
import classnames from 'classnames';
import $ from 'jquery';
import OwlCarousel from 'react-owl-carousel';
import SlackMessage from './slack-message';
import RedisAlert from './redis-alert';

const pageComponentList = {
  SlackMessage,
  RedisAlert
};

export default class Page extends React.Component {
  render() {
    var styleClass = classnames({'page': true});
    var activeComponents = [];
    this.props.config.map(function(component) {
      activeComponents.push({id: pageComponentList[component.name], config: component});
    });
    return (
      <div className={styleClass}>
        {activeComponents.map(function(Component, i) {
          return <Component.id key={i} config={Component.config} firebase_db={this.props.firebase_db} />
        }.bind(this))}
      </div>
    );
  }
};
