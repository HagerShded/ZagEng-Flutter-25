import 'package:flutter/material.dart';
import 'package:fluttercourse/home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
      theme: ThemeData(
        primaryColor: const Color(0xffffa957),
        scaffoldBackgroundColor: const Color(0xffffa957)


      ),
   
    );
  }
}

