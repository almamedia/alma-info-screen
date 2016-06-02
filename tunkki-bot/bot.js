'use strict';

var Botkit = require('botkit');
var request = require('request');

// Send text to infoscreen with api.
function send_to_infoscreen(text, bot_response) {
  var options = {
    method: 'PATCH',
    url: "http://localhost:3000/componentdata",
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

var controller = Botkit.slackbot({
  debug: false
});

controller.spawn({
  token: "xoxb-36601590166-ShtScvJ1xcKk7FjklxQ7ugrd",
}).startRTM();

// react when keyword is posted in channel.
controller.hears(['!info'],'ambient',function(bot,message) {
  var text = message.text.slice(6); // text after "!info"

  var bot_response = function(success) {
    var reply = success ? "Message sent." : "Sending failed.";
    bot.reply(message, reply);
  }
  send_to_infoscreen(text, bot_response);

});
