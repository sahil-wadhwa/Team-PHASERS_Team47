import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaagran/pages/dial_page.dart';
import 'package:jaagran/pages/emergency_page.dart';
import 'package:jaagran/pages/feed_page.dart';
import 'package:jaagran/pages/map_page.dart';
import 'package:jaagran/pages/safety_page.dart';
import 'package:jaagran/pages/safety_rating.dart';
import 'package:jaagran/pages/wearable_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final menuTitles = [
    "D E V I C E ",
    "E M E R G E N C Y ",
    "A C C O U N T",
    "S A F E T Y"
  ];
  final pages = [
    const MapPage(),
    const WearablePage(),
    const DialPage(),
    SafetyRating()
  ];
  int _selectedIndex = 0;

  void setPageSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(68, 47, 116, 1),
        height: 90,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        elevation: 20,
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(68, 47, 116, 1),
          currentIndex: _selectedIndex,
          onTap: setPageSelect,
          elevation: 0,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "Wearable",
              icon: Icon(
                Icons.watch_outlined,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "Dial",
              icon: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "Feed",
              icon: Icon(
                CupertinoIcons.book,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: const Text("Emergency"),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 3,
        onPressed: () {
          // Get.to((context) => const AnnouncementPost(),
          //     transition: Transition.zoom);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EmergencyPage()));
        },
        child: const Icon(CupertinoIcons.exclamationmark_triangle,
            color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        title: const Text(
          "JaagRan",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
        actions: const [
          Image(
            image: AssetImage('images/logo.jpg'),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 2,
        child: ListView.builder(
          itemCount: menuTitles.length,
          itemBuilder: (context, index) => ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SafetyPage()));
                },
                child: Text(menuTitles[index])),
          ),
        ),
      ),
    );
  }
}
