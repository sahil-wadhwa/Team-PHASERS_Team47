import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class SafetyRating extends StatefulWidget {
  @override
  _SafetyRatingState createState() => _SafetyRatingState();
}

class _SafetyRatingState extends State<SafetyRating> {
  String safetyRating = 'Fetching safety rating...';

  @override
  void initState() {
    super.initState();
    _getLocationAndFetchSafetyRating();
  }

  // Function to fetch the user's location
  Future<void> _getLocationAndFetchSafetyRating() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   setState(() {
    //     safetyRating = 'Location services are disabled.';
    //   });
    //   return;
    // }

    // Check for location permission
    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied ||
    //     permission == LocationPermission.deniedForever) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission != LocationPermission.whileInUse &&
    //       permission != LocationPermission.always) {
    //     setState(() {
    //       safetyRating = 'Location permissions are denied.';
    //     });
    //     return;
    //   }
    // }

    // Get the user's current location
    Location _locationController = Location();

    LocationData _locationData = await _locationController.getLocation();
    double? lat = null;
    double? long = null;

    setState(() {
      lat = _locationData.latitude!;
      long = _locationData.longitude!;
    });

    // Call the API with the fetched coordinates
    _fetchSafetyRating(lat!, long!);
  }

  // Function to fetch safety rating from the API
  Future<void> _fetchSafetyRating(double lat, double lon) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api-rating.onrender.com/safety_rating?lat=$lat&lon=$lon'));
      print(lat + lon);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          safetyRating = 'Safety Rating: ${data['safety_rating']}';
        });
      } else {
        setState(() {
          safetyRating = 'Failed to fetch safety rating.';
        });
      }
    } catch (e) {
      setState(() {
        safetyRating = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Rating'),
      ),
      body: Center(
        child: Text(safetyRating),
      ),
    );
  }
}
