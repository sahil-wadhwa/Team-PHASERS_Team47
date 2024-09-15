import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class WearablePage extends StatefulWidget {
  const WearablePage({super.key});

  @override
  State<WearablePage> createState() => _WearablePageState();
}

class _WearablePageState extends State<WearablePage> {
  GlobalKey _globalKey = GlobalKey();
  bool showContainer = false;
  List<String> data = [];
  int count = 0;
  final TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid:
          'AC77a175ea6cb7227f121023543e751cb5', // replace with Account SID
      authToken: '35eea206cc8707c275a66d20ca5dcbcb', // replace with Auth Token
      twilioNumber:
          '+14012340362' // replace with Twilio Number(With country code)
      );

  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (this.mounted) {
        setState(() {
          values = fetchValues();
          fetchValues().then((val) {
            if (val[3] == "Big squeeze") {
              _textMe();
            }
            if (val[3] == "Medium squeeze") {
              count++;
              if (count > 3) {
                _showMessage();
              }
            }
          });
        });
      }
    });
  }

  _textMe() async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Sharing Location")));
    Location _locationController = new Location();
    LocationData _locationdata = await _locationController.getLocation();
    LatLng _pos = LatLng(_locationdata.latitude!, _locationdata.longitude!);
    callEmerency();
    // Android
    // String uri =
    //     'sms:+91 93110-73689?body=My location is:https://maps.google.com/maps?q=${_pos.latitude},${_pos.longitude}. Please Help Me.';
    // if (Platform.isAndroid) {
    //   //FOR Android
    //   await launch(uri);
    // }

    twilioFlutter.sendSMS(
        toNumber: "+918809224531",
        messageBody:
            "My location is: https://maps.google.com/maps?q=${_pos.latitude},${_pos.longitude}");
  }

  Future<List<String>> fetchValues() async {
    final responseX = await http.get(Uri.parse(
        'https://blr1.blynk.cloud/external/api/get?token=doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E&v2'));
    final responseY = await http.get(Uri.parse(
        'https://blr1.blynk.cloud/external/api/get?token=doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E&v3'));
    final responseZ = await http.get(Uri.parse(
        'https://blr1.blynk.cloud/external/api/get?token=doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E&v4'));
    final force = await http.get(Uri.parse(
        'https://blr1.blynk.cloud/external/api/get?token=doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E&v6'));
    final pulse = await http.get(Uri.parse(
        'https://blr1.blynk.cloud/external/api/get?token=doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E&v5'));

    if (responseX.statusCode == 200) {
      // If the server did return a 200 OK responseX,
      // then parse the JSON.
      return [
        responseX.body,
        responseY.body,
        responseZ.body,
        force.body,
        pulse.body
      ];
    } else {
      // If the server did not return a 200 OK responseX,
      // then throw an exception.
      throw Exception('Failed to load Value');
    }
  }

  late Future<List<String>> values = fetchValues();
  void readValues() {
    if (this.mounted) {
      setState(() {
        values = fetchValues();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 195, 213),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('images/watch.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: FutureBuilder<List<String>>(
                    future: values,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, bottom: 18, left: 30, right: 30),
                          child: Text(
                            'AngleX: ${snapshot.data![0]}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('data');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: FutureBuilder<List<String>>(
                    future: values,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, bottom: 18, left: 30, right: 30),
                          child: Text(
                            'AngleY: ${snapshot.data![1]}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('data');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: FutureBuilder<List<String>>(
                    future: values,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, bottom: 18, left: 30, right: 30),
                          child: Text(
                            'AngleZ: ${snapshot.data![2]}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('data');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: FutureBuilder<List<String>>(
                    future: values,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, bottom: 18, left: 30, right: 30),
                          child: Text(
                            'Pulse: ${snapshot.data![4]}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('data');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20)),
            child: FutureBuilder<List<String>>(
              future: values,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, bottom: 18, left: 30, right: 30),
                    child: Text(
                      'Force: ${snapshot.data![3]}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('data');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          IconButton(onPressed: readValues, icon: const Icon(Icons.refresh)),
          Visibility(
            visible: showContainer,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              height: 100,
              width: 300,
              child: Center(
                child: Column(
                  children: [
                    const Text("Are you in trouble?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _textMe,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                    child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _showMessage,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                    child: Text(
                                  "No",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  callEmerency() async {
    const number = '8809224531';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  void _showMessage() {
    setState(() {
      showContainer = !showContainer;
    });
  }
}
