import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/constants.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

String payload = 'Currently no message :(';

class mqtt extends StatefulWidget {
  static const String id = 'mqtt';
  @override
  _mqttState createState() => _mqttState();
}

class _mqttState extends State<mqtt> {
  String statustext = 'Status Text';
  String ans = '';
  bool isconnected = false;
  TextEditingController idtextcontroller = TextEditingController();
  final MqttServerClient client =
      MqttServerClient('alwi9qbn7be3y-ats.iot.us-east-2.amazonaws.com', '');
  Future<bool> mqttconnect(String uniqueid) async {
    setstatus('connecting mqtt broker!!');
    ByteData rootca = await rootBundle.load('assets/certs/AmazonRootCA1.pem');
    ByteData devicecert =
        await rootBundle.load('assets/certs/certificate.pem.crt');
    ByteData privatekey = await rootBundle.load('assets/certs/private.pem.key');
    SecurityContext context = SecurityContext.defaultContext;
    context.setClientAuthoritiesBytes(rootca.buffer.asInt8List());
    context.useCertificateChainBytes(devicecert.buffer.asInt8List());
    context.usePrivateKeyBytes(privatekey.buffer.asInt8List());
    client.securityContext = context;
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.port = 8883;
    client.secure = true;
    client.onConnected = onconnected;
    client.onDisconnected = ondisconnected;
    client.pongCallback = pong;
    final MqttConnectMessage conmess =
        MqttConnectMessage().withClientIdentifier(uniqueid).startClean();
    client.connectionMessage = conmess;
    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('connected to aws successfully');
    } else {
      return false;
    }
    const topic = 'outTopic';
    client.subscribe(topic, MqttQos.atMostOnce);
    // print('s//ubbbb');

    return true;
  }

  Widget bodystream() {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: client.updates,
        builder: (BuildContext context,
            AsyncSnapshot<List<MqttReceivedMessage<MqttMessage>>> snapshot) {
          if (!snapshot.hasData)
            return Container(
              color: Colors.white,
//              child: Text('NO data'),
            );
          else {
            final x = snapshot.data as List<MqttReceivedMessage<MqttMessage?>>?;
            final recmess = x![0].payload as MqttPublishMessage;
            print(recmess.payload.message);
            payload = MqttPublishPayload.bytesToStringAsString(
                recmess.payload.message);
            print(payload);

            return Container(
              color: Colors.white,
              //child: Text('$recmess.payload.message'),
              child: Text('$payload',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            );
          }
        },
      ),
    );
  }

  _connect() async {
    isconnected = await mqttconnect(idtextcontroller.text.trim());
  }

  _disconnect() {
    client.disconnect();
  }

  void setstatus(String content) async {
    setState(() {
      statustext = content;
    });
  }

  void onconnected() {
    setstatus('client connected ');
  }

  void ondisconnected() {
    setstatus('client disconnected');
    isconnected = false;
  }

  void pong() {
    setState(() {
      ans = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Inventory Management!!!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreya(
                    // ignore: prefer_const_constructors
                    textStyle: TextStyle(
                      fontSize: 40,
                      color: const Color(0xFF48A9A6),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      mqttconnect('');
                    },
                    child: Text(
                      'Press to check!!',
                      style: TextStyle(color: Colors.purple[200], fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Center(child: bodystream()),
                SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
