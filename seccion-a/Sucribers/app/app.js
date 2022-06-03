const mqtt = require('mqtt')

const protocol = 'mqtt'
const complete_host_URI = protocol.concat('://',process.env.HOST, ':', process.env.PORT)

console.log("Connection info:");
console.log(complete_host_URI);
console.log(process.env.TOPIC);
console.log("----------------");

const client = mqtt.connect(complete_host_URI)

client.on('connect', function () {
	client.subscribe(process.env.TOPIC, function (err) {
		if (err) {
			console.log(err.message)
		}
	});
});

client.on('message', function(topic, message) {
	console.log(message.toString())
});
