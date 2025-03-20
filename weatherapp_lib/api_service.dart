import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = " 5597b538c1614be092a203650252003"; 
  final String baseUrl = "https://api.weatherapi.com/v1/current.json";

  Future<Map<String, dynamic>?> getWeather(String city) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl?key=$apiKey&q=$city&aqi=no"));

      print("Response: ${response.body}"); 

      if (response.statusCode == 200) {
        return jsonDecode(response.body); 
      } else {
        print("Error fetching data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}



