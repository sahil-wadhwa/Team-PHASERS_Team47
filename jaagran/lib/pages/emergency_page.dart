import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: GestureDetector(
        onDoubleTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Sharing Location")));
          callPolicehandler();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RippleAnimation(
                key: UniqueKey(),
                minRadius: 180,
                repeat: true,
                duration: const Duration(milliseconds: 2300),
                ripplesCount: 10,
                color: Colors.orange,
                size: Size.square(300),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Colors.white),
                    child: const Center(
                        child: Text(
                      "EMERGENCY",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Tap Twice To Activate Emergency Mode",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: 100,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
    );
  }

  callPolicehandler() async {
    const number = '8920365995';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
