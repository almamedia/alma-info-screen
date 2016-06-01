import React from 'react';
import classnames from 'classnames';

export default class FoodMenu extends React.Component {

  constructor(props) {
    super(props);
  }

  componentWillMount() {
    // this.props.firebase_db.ref('/component_data').on('value', function(data) {
    //   data.val()[Object.keys(data.val())[0]].map(function(component_data, i) {
    //     if (component_data.name == this.constructor.name) {
    //       this.setState({
    //         current_message: (component_data.data.current_message ? component_data.data.current_message : "Lähetä viesti komennolla: !info [viesti]")
    //       });
    //     }
    //   }.bind(this));
    // }.bind(this));
  }

  render() {
    const { name, menu } = this.props;
    const menuList = menu.map(menuItem => {
      return <li>
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
