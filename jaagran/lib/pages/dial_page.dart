import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DialPage extends StatefulWidget {
  const DialPage({super.key});

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  List<String> emergency = [
    "12345 67890",
    "45678 90123",
    "90123 45678",
    "78901 23456",
    "41234 56789",
    "76541 20910",
    "74795 35892",
    "88562 18781"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255, 236, 208, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red,
                        ),
                        child: const Center(
                            child: Text(
                          "*",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            "Call 100",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Police",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: callPolicehandler,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255, 236, 208, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red,
                        ),
                        child: const Center(
                            child: Text(
                          "*",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            "Call 181",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Women Helpline",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: callWomenHelpline,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Emergency Contacts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: 450,
              child: ListView.builder(
                itemCount: emergency.length,
                itemExtent: 100,
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 236, 208, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  'Contact ${index + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text('+91 ${emergency[index]}'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(40)),
                            child: IconButton(
                                onPressed: () =>
                                    callEmergency(emergency[index]),
                                icon: const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  callPolicehandler() async {
    const number = '100';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  void callWomenHelpline() async {
    const number = '181';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  void callEmergency(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
