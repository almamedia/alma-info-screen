import React from 'react';
import classnames from 'classnames';

import FoodMenu from './food-menu';

export default class FoodMenus extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      restaurants: [{"name":"fazer","menu":["Nordic buffet: Bataatti-maissipihvejä   (A, G, L, M, VS)","Päivän keittolounas: Siikakeittoa (*, A, G, L)","Chef’s corner: Rukiinen savulohihampurilainen ja Maalaislohkoperunoita (L, M)","Chef’s corner: Kreikkalainen salaatti   (A, G, VL)","Chef’s corner: Grillattua kananpojan rintaa, kasviksia ja paprikakastike (A, G, L, VS)"]},{"name":"bastis","menu":["","","","",""]},{"name":"satkar","menu":["1. Mismas Tarkari ","- sekavihanneksia tomaatti-sipuli-kermakastikkeessa","2. Saag Paneer","- tuorejuustoa miedossa pinaattikastikkeessa","3. Karahi Chicken ","- kananpaloja mausteisessa tuoretomaatti-paprika-sipulikastikkeessa","4. Prawn Curry","- katkarapuja miedossa sipuli-tomaati kastikkeessa","5. Butter Lamb","- lammasta tomaatti-kookos-kerma-voikastikkeessa"," ","Kaikkiin annoksiin kuuluu basmatiriisiä, raitaa (jugurtti), papukastiketta ja tandoori-uunin Nan-leipää. Jälkiruoaksi kahvia tai nepalilaista teetä."]}]
    };
  }

  componentWillMount() {
    // this.props.firebase_db.ref('/component_data').on('value', function(data) {
    //   data.val()[Object.keys(data.val())[0]].map(function(component_data, i) {
    //     if (component_data.name == this.constructor.name) {
    //       this.setState({
    //         restaurants: (component_data.data.restaurants ? component_data.data.restaurants : [])
    //       });
    //     }
    //   }.bind(this));
    // }.bind(this));
  }

  render() {
    const { restaurants } = this.state;
    const { config } = this.props;
    const menuComponents = restaurants.map(restaurant => {
      return <FoodMenu
        name = {restaurant.name}
        menu = {restaurant.menu}
      />
    });

    var styleClass = classnames(
      {'food-menus-box': true}
     );

     const styles = {
       width: config.width,
       height: config.height
     }

    return (
      <div className={styleClass} style={styles}>
        <div className="food-menus-header">Ruokalistat</div>
        { menuComponents }
      </div>
    );
  }
};
