import mqtt.*;

MQTTClient client;
ArrayList<String> messageHistory = new ArrayList();
int fontSize = 28;

void setup()
{
  size(600,600);
  textSize(fontSize);
  client = new MQTTClient(this);
  client.connect("mqtt://broker.hivemq.com:1883");
//  client.connect("mqtt://test.mosquitto.org:1883");
//  client.connect("mqtt://public-mqtt-broker.bevywise.com:1883");
}

void draw()
{
  background(0);
  for(String message: messageHistory) {
    translate(0,fontSize);
    text(message,10,0);
  }
}

void clientConnected()
{
  println("Connected to broker for receiving");
  client.subscribe("plymouth/#");
}

void messageReceived(String topic, byte[] payload)
{
  messageHistory.add(0,topic + ":" + new String(payload));
  while(messageHistory.size()>10) messageHistory.remove(messageHistory.size()-1);
}
