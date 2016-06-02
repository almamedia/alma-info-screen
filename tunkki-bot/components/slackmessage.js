'use strict';
module.exports = function(controller, request, InfoApi) {
  function send_to_infoscreen(text, bot_response) {
    var options = {
      method: 'PATCH',
      url: InfoApi + "/componentdata",
      form: {name: "SlackMessage", data: JSON.stringify({current_message: text})}
    };
    var handleResponse = function(err, httpResponse, body) {
      if (err) {
        bot_response(false);
      } else {
        bot_response(true);
      }
    };
    request(options, handleResponse);
  }

  controller.hears(['!info'],'ambient',function(bot,message) {
    var text = message.text.slice(6); // text after "!info"
    var bot_response = function(success) {
      var reply = success ? "Viesti lähetetty! :tada:" : "Ups.. ei pysty. :sadpepe: :fire:";
      bot.reply(message, reply);
    }
    send_to_infoscreen(text, bot_response);
  });
};
