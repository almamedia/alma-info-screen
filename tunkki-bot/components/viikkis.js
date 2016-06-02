'use strict';
module.exports = function(controller, request, InfoApi, channel_id) {
  var osaston_nimet = [
                      "Antti",
                      "Max",
                      "Juha-Matti",
                      "Peter",
                      "Ville",
                      "Jussi",
                      "Juho",
                      "Kirsti",
                      "Janne",
                      "Valtteri",
                      "Timo",
                      "Heli",
                      "Valon",
                      "Ukko",
                      "Johanna",
                      "Mats",
                      "Vepi",
                      "Joni"
                      ]

  function send_to_infoscreen(text) {
    var options = {
      method: 'PATCH',
      url: InfoApi + "/componentdata",
      form: {name: "Viikkis", data: JSON.stringify({tiedottaja: text})}
    };
    var handleResponse = function(err, httpResponse, body) {
      if (err) {
        console.log(err);
      } else {
        console.log("Viikkotiedottaja info screen updated!");
      }
    };
    request(options, handleResponse);
  }

  function get_current_tiedottaja(bot, message) {
    var options = {
      method: 'GET',
      url: InfoApi + "/componentdata/Viikkis"
    };
    var handleResponse = function(err, httpResponse, body) {
      if (err) {
        console.log(err);
      } else {
        var component_data = JSON.parse(body);
        bot.reply(message, "Tällä viikolla viikkisvuorossa on: " + component_data.data.tiedottaja);
      }
    };
    request(options, handleResponse);
  }

  controller.hears(['!viikkis'],'ambient',function(bot,message) {
    var text = message.text.slice(9); // text after "!viikkis"
    if (text == "arvo") {
      bot.reply(message, ":crystal_ball: :game_die: Viikkotiedottajan arvonta käynnissä.. :game_die: :crystal_ball:");
      var viikkotiedottaja = osaston_nimet[Math.floor(Math.random() * osaston_nimet.length)]
      setTimeout(function() {
        bot.reply(message, ":confetti_ball: :tada: :confetti_ball: :tada: :cake: Viikkotiedottajaksi on arvottu: "+viikkotiedottaja+" :cake: :tada: :confetti_ball: :tada: :confetti_ball:")
        send_to_infoscreen(viikkotiedottaja);
        //bot.say({text: ":confetti_ball: :tada: :confetti_ball: :tada: :cake: Viikkotiedottajaksi on arvottu: "+viikkotiedottaja+" :cake: :tada: :confetti_ball: :tada: :confetti_ball:", channel: channel_id})
      }, 3000);
    } else {
      get_current_tiedottaja(bot, message);
    }
  });
};
