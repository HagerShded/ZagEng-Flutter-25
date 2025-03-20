import 'package:flutter/material.dart';
import 'api_service.dart';

class WeatherSearchDelegate extends SearchDelegate {
  final ApiService apiService = ApiService();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; 
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); 
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    String city = query.trim();
    //print("$city");

    if (city.isEmpty) {
      return Center(child: Text("Please enter a valid city name"));
    }

    return FutureBuilder(
      future: apiService.getWeather(city),
      builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); 
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("No Data found for: $city"));
        } else {
          final weatherData = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                     Icon(Icons.location_on, size: 30, color: Colors.white,),
                    Text(
                      " ${weatherData['location']['name']}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    Text(
                  " ${weatherData['location']['country']}",style: TextStyle(color: Colors.white)),
                  ],
                ),
               
                Text(" ${weatherData['current']['temp_c']}",style: TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,)),
                Text(" ${weatherData['current']['condition']['text']}",style: TextStyle(color:Colors.white,)),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Type a city name..."));
  }
}