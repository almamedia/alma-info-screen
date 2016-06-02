'use strict';

var SlackMessage = require("./components/slackmessage.js");
var Viikkis = require("./components/viikkis.js");
var request = require('request');
var Botkit = require('botkit');
var InfoApi = "http://localhost:3000"
var iltalehti_channel_id = 'G0373774N'
var iltalehti_basement_channel_id = 'C15BZ1VCJ'
var tunkkidemo_channel_id = 'C12HTB2VC'
var controller = Botkit.slackbot({
  debug: false
});

controller.spawn({
  token: "xoxb-36601590166-ShtScvJ1xcKk7FjklxQ7ugrd",
}).startRTM();


/* Component list */
SlackMessage(controller, request, InfoApi);
Viikkis(controller, request, InfoApi, tunkkidemo_channel_id);

