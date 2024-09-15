import 'package:flutter/material.dart';

class SafetyPage extends StatefulWidget {
  const SafetyPage({super.key});

  @override
  State<SafetyPage> createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  bool containerVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 236, 208, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: showAlert,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "How Safe is your location?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 139, 26, 18),
                  size: 60,
                ),
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 248, 44, 30),
                  size: 60,
                ),
                Icon(
                  Icons.location_on,
                  size: 60,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.yellow,
                  size: 60,
                ),
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 239, 65, 123),
                  size: 60,
                ),
              ],
            ),
            Visibility(
                visible: containerVisible,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 100,
                    width: 300,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 28.0),
                        child: Text(
                          "Alert!!!!!",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  void showAlert() {
    print("Helo");
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        containerVisible = !containerVisible;
      });
    });
  }
}
