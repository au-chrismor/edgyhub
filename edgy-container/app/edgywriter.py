import time
import paho.mqtt.client as mqtt

# Callback for CONNACK response
def on_connect(client, userdata, flags, reason_code, properties):
    print(f"Connected with result code={reason_code}")
#    client.subscribe("$SYS/#")
    client.subscribe("EDGY/#")


# Callback for PUBLISH received
def on_message(client, userdata, msg):
    print(f"Topic={msg.topic}, Payload={msg.payload}")


mqttc = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2)
mqttc.username_pw_set("process_a", "PASSWORD_0")
mqttc.on_connect = on_connect
mqttc.on_message = on_message

mqttc.connect("172.17.0.2", 1883, 60)

mqttc.loop_forever()
