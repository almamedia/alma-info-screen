# il-info-screen

Tämä projekti koostuu kolmesta osasta:
- dashboard, joka on avattuna info telkkarissa. Lukee datan firebase:sta.
- Api:sta, joka välittää sille lähetetyt tiedot firebase-kantaan dashboardia varten.
- Useista pienista skripteistä (tunkkibot, food_menu), jotka kutsuvat apia ja lähettävät tietoa vastaaville komponenteille dashboardissa (apin välityksellä).

## Api

- Laita firebase osoitteesi ja avaimesi tiedostoon: ./api/config/firebase.rb
- `rails server` /api hakemistossa käynnistää sen osoitteeseen http://localhost:3000/.
- Api tarjoaa REST-apin pages, components ja components_data resursseille.

### Sisällön konfigurointi

Apin käyttöä on seuraavassa esitelty curl:in avulla.

- Uuden sivun lisääminen dashboardiin (muokkaa nimi haluamaksesi):
  - `$curl -X POST -d "name=Page1" localhost:3000/page`

- Sivulle tällähetkellä asetetut komponentit ja niiden asetukset:
  - `curl -X GET localhost:3000/page/Page1`

- Kaikki sivut komponentteineen:
  - `curl -X GET localhost:3000/page/`

- Uuden komponentin luonti sivulle:
  - `curl -X POST -d "page_name=Page1" -d "name=SlackMessage" -d "width=500" -d "height=200" -d "float=left" localhost:3000/component`
  - Aseta sivun nimi valmiiksi luomasi sivun mukaan ja aseta komponentin koko ja sijainti haluamaksesi.

- Komponentin asetusten päivitys (tarvitset component_id:n, jonka saat esimerkiksi listaamalla kaikki sivun komponentit):
  - `curl -X PATCH -d "page_name=Page1" -d "component_id=-KJAUvq0Img6DEXPPFWI" -d "width=800" localhost:3000/component`

- Komponentin poistaminen:
  - `curl -X DELETE -d "page_name=Page1" -d "component_id=-KJAUvq0Img6DEXPPFWI" localhost:3000/component`

### Komponenttien datan luonti ja päivitys

- Näytä kaikkien komponenttien sisältämä data:
  - `curl -X GET localhost:3000/componentdata`

- Näytä yksittäisen komponentin sisältämä data:
  - `curl -X GET localhost:3000/componentdata/SlackMessage`

- Luo komponentille dataa ensimmäistä kertaa:
  - `curl -X POST -d "name=SlackMessage" -d 'data={"current_message": "testi viesti"}' localhost:3000/componentdata`

- Muokkaa komponentin dataa (tämä on hyvä skriptejä varten):
  - `curl -X PATCH -d "name=SlackMessage" -d 'data={"current_message": "testi viesti 123"}' localhost:3000/componentdata`


## Dashboard

Toteutettu Reactilla, käyttää lisäksi react-owl-carousel ja reactfire -komponenttia.

Javascript on ES2015 versiota ja käännetään babelilla.

### Kehitysympäristö
- Siirry dashboard hakemistoon.
- Asenna tarvittavat node moduulit:
  - `npm install`
- Aseta api endpoint screen-komponenttiin.
- `npm start` käynnistää webpack-dev-server:in localhostin portissa 8080 kehitystyötä varten.
- Komento `webpack` kääntää tiedostot /dist kansioon tuotantoa varten.

- Uuden komponentin lisäys:
  - Luo uusi jsx tiedosto components -kansioon.
  - Kopioi valmis komponentti ja muokaa render-metodi haluamaksesi.

### Tuotanto
- Jaa tiedostot /dist kansiosta.

## Tunkkibot

- Asenna vaadittavat node moduulit: `npm install`
- Aseta API osoite haluamaksesi.
- Käynnistä botti: `node bot.js`

## Food Menu
- TODO
