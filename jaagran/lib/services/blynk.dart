// import 'package:http/http.dart' as http;
// import 'water_usage_data.dart'; // Make sure this import points to the correct file location.

// class BlynkService {
//   final String _serverAddress = 'https://blr1.blynk.cloud/external/api/update?token=doTO9yHOU4UzOhWhwHt2XzWQGv-v0S2E&v2=value';
//   final String _authToken = 'hfOV9v8pcSqGi331yjas-vrAKNxzaf9k';
//   late WaterUsageData waterUsageData;

//   BlynkService() {
//     // Initialize your waterUsageData with default values
//     waterUsageData = WaterUsageData(
//       flowRate: 0.0,
//       totalUsed: 0,
//       usedToday: 0,
//       waterLimit: 0,
//     );
//   }

//   Future<void> _sendGetRequest(String url) async {
//     final uri = Uri.parse(url);
//     try {
//       final response = await http.get(uri);
//       if (response.statusCode != 200) {
//         print('Request failed with status: ${response.statusCode}.');
//       }
//     } catch (e) {
//       print('An error occurred: $e');
//     }
//   }

//   Future<void> _writeData(String pin, String value) async {
//     String url = '$_serverAddress/external/api/update?token=$_authToken&pin=$pin&value=$value';
//     await _sendGetRequest(url);
//   }

//   Future<String> _readData(String pin) async {
//     String url = '$_serverAddress/external/api/get?token=$_authToken&pin=$pin';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         return response.body;
//       } else {
//         print('Failed to load data from Blynk server. Status code: ${response.statusCode}');
//         return 'Error';
//       }
//     } catch (e) {
//       print('Error fetching data from Blynk server: $e');
//       return 'Error';
//     }
//   }

//   Future<void> updateWaterUsageData() async {
//     // Fetch and parse the data from the Blynk server
//     waterUsageData = WaterUsageData(
//       flowRate: double.tryParse(await _readData('V0')) ?? 0.0,
//       usedToday: int.tryParse(await _readData('V3')) ?? 0,
//       totalUsed: int.tryParse(await _readData('V4')) ?? 0,
//       waterLimit: int.tryParse(await _readData('V5')) ?? 0, // Replace 'V5' with actual pin for water limit if you have it
//     );
//   }

//   Future<void> handlePayment(double amount) async {
//     // Ensure that waterUsageData is up-to-date before handling payment
//     await updateWaterUsageData();

//     // Add the amount to the current limit and write it back to the Blynk server
//     double updatedLimit = waterUsageData.waterLimit + amount;
//     await _writeData('V2', updatedLimit.toString()); // Replace 'V2' with the actual pin for updating the water limit
//   }
// }"