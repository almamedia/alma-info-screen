var Botkit = require('botkit');
var request = require('request');

function send_to_infoscreen(text) {
  var success = false;
  var options = {
    method: 'PATCH',
    uri: 'localhost:3000/componentdata'
  };

  request.post(
    options,
    {form: {name:'SlackBot'}, data: {current_message: text}},
    function(err, httpResponse, body) {
     if (err) {
       status = false;
     } else {
       status = true;
     }
   });

   return status;
}

var controller = Botkit.slackbot({
  debug: false
});

controller.spawn({
  token: "xoxb-36601590166-ShtScvJ1xcKk7FjklxQ7ugrd",
}).startRTM();

controller.hears(['!info'],'ambient',function(bot,message) {
  var text = message.text.slice(6);
  var success = send_to_infoscreen(text);
  var reply = success ? "Message sent." : "Sending failed.";
  bot.reply(message, reply);
});
