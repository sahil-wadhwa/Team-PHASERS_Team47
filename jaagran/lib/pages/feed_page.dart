import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<String> title = [
    "Not Safe",
    "Nooo Bad Location",
    "Safe place",
    "User Identified suspicious"
  ];
  final user = ["Joe Dane", "James Ross", "Michael A.", "Harvey Spector"];
  final location = ["Kamla Nagar", "Hetalput", "Faridabad", "Muzaffarnagar"];
  final details = [
    "Kamala Nagar isn’t safe for women. Just last week, my friend faced harassment while walking home in the evening. The area seems increasingly unsafe, and it's alarming how such incidents are becoming more frequent.",
    "Hetalput isn’t safe for at night... just filled with creep auto drivers and cabs. please avoid cabs strictly and use public service.The area seems increasingly unsafe, and it's alarming how such incidents are becoming more frequent.",
    "Faridabad is safe for girls at night... it has local police that monitor the area constantly.",
    "Muzzafarnagar is not walkable after evening hours. strictly need action for local gangsters ove rthere",
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //   body: ListView.builder(
      //       itemCount: title.length,
      //       itemBuilder: (context, index) => Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               height: 320,
      //               decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   border: Border.all(style: BorderStyle.solid),
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       title[index],
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 30,
      //                           fontStyle: FontStyle.italic),
      //                     ),
      //                     Text(
      //                       user[index],
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 20,
      //                           fontStyle: FontStyle.italic),
      //                     ),
      //                     Text(
      //                       location[index],
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 15,
      //                           fontStyle: FontStyle.italic),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 18.0),
      //                       child: Text(
      //                         details[index],
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 20,
      //                             fontStyle: FontStyle.italic),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.0, left: 8),
            child: Text(
              "Discover",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Latest News from over the world"),
          )
        ],
      ),
    );
  }
}
