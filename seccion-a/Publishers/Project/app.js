var mqtt = require('mqtt');
const dayjs = require('dayjs')
const { exec } = require("child_process");

var broker = process.env.NOMBREBROK;
var port = process.env.PORT;
var topic = process.env.TOPIC;
var containerName = process.env.HOSTNAME;

var ip = process.env.IP
exec("hostname -I",(error, stdout, stderr) => {
  if (error) {
      console.log(`error: ${error.message}`);
      return;
  }
  if (stderr) {
      console.log(`stderr: ${stderr}`);
      return;
  }
  console.log(`stdout: ${stdout}`);
  ip = stdout
});

const protocol = 'mqtt'
const complete_host_URI = protocol.concat('://',broker, ':', port)

console.log("soy IP")
console.log(ip)
console.log("Soy command")
console.log(process.env)


var client = mqtt.connect(complete_host_URI);

client.on('connect', function () {
  setInterval(function (){
    msg = {"time":dayjs().format("ddd MMM DD HH:mm:ss ZZ YYYY"), "container":containerName, "ip":ip}
    client.publish(topic, JSON.stringify(msg));
  }, 5000);
})