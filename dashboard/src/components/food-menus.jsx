import React from 'react';
import classnames from 'classnames';

import FoodMenu from './food-menu';

export default class FoodMenus extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const { config } = this.props;
    const restaurants = this.props.data;
    const menuComponents = restaurants.map((restaurant, index) => {
      return <FoodMenu
        name = {restaurant.name}
        menu = {restaurant.menu}
        key  = {index}
      />
    });

    var styleClass = classnames(
      {'food-menus-box': true}
     );

     const styles = {
       width:  config.width,
       height: config.height,
       float:  config.float
     }

    return (
      <div className={styleClass} style={styles}>
        <div className="food-menus-header">Ruokalistat</div>
        { menuComponents }
      </div>
    );
  }
};
