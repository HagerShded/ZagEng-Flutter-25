import 'package:flutter/material.dart';
import 'search_delegate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",style: TextStyle(color: Colors.white),),centerTitle: true,
        backgroundColor: const Color(0xffffa957),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: WeatherSearchDelegate());
            },
          ),
        ],
      ),
      body: Center(
        child: const Text("tap to search for city weather"),
         
         
      ),
    );
  }
}










/*import 'package:flutter/material.dart';
import 'api_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}
class _HomePageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService();
   Map<String,dynamic>? weatherData;
  bool isLoading = false;

  Future<void>fetchData() async{
    String city= searchController.text.trim();
    if(city.isEmpty) return;
       setState(() {
      isLoading= true;
      weatherData=null;
    });
    var data= await apiService.getWeather("cairo");
    setState(() {
      isLoading=false;
      weatherData=data;
    });
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Today"),centerTitle: true,
        backgroundColor:const Color(0xffffa957),
        actions: [],
      ),
      body:
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField( controller: searchController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: " Search here...",
                suffixIcon: IconButton(onPressed: fetchData, icon: Icon(Icons.search)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),  
                  borderSide: BorderSide.none,  
                 
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),

              ),
            ),
          const  SizedBox(height: 20),
            
            isLoading 
              ? const CircularProgressIndicator() 
              : weatherData != null 
                ? Column(
                    children: [
                      Text(
                        "city: ${weatherData!["location"]["name"]}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("temp: ${weatherData!["current"]["temp_c"]} °C"),
                    ],
                  )
                : const Text(
                    "No data available. Please search for a city.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
          ],
        ),
             )
    );
  }
}

*/
