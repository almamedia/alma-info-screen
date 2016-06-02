import React from 'react';
import classnames from 'classnames';

export default class FoodMenu extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const { name, menu } = this.props;
    const menuList = menu.map((menuItem, index) => {
      return <li key = {index}>
              {menuItem}
             </li>
    });
    var styleClass = classnames({'food-menu': true});
    return (
      <div className={styleClass}>
        <h1 className="title">{name}</h1>
        <ul>
          { menuList }
        </ul>
      </div>
    );
  }
};
