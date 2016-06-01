var Botkit = require('botkit');

var controller = Botkit.slackbot({
  debug: false
});

controller.spawn({
  token: "xoxb-36601590166-ShtScvJ1xcKk7FjklxQ7ugrd",
}).startRTM()

controller.hears('tunkkitesti',['direct_message','direct_mention','mention'],function(bot,message) {
  bot.say({text:"test", channel: "#tunkkidemo"});
});
