 import 'dart:math';
/* 
appBar > column > row of gender (icon, label)> 
row of height counter(column: H, value,slider) >
 row of age & weight counter(column: W, value, row +,-) > 
 calcualte button : elevated > result : function
 
*/ 
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF87B1E3),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  bool isMale = true;
  double height = 150;
  int weight = 50;
  int age = 18;
  double bmi = 0;

  void calculateBMI() {
    setState(() {
      // bmi= w / h^2
      bmi = weight / pow(height/100 , 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _genderRow(
                      icon: Icons.male, label: "Male", selected: isMale),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _genderRow(
                      icon: Icons.female, label: "Female", selected: !isMale),
                ),
              ],
            ),
           const  SizedBox(height: 10),
            _heightRow(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _ageWeighCounter("Age", age, () => setState(() => age++), () => setState(() => age--))),
                SizedBox(width: 10),
                Expanded(child: _ageWeighCounter("Weight", weight, () => setState(() => weight++), () => setState(() => weight--))),
              ],
            ),
            const SizedBox(height: 10),
            //calculate button
            ElevatedButton( 
              style: ElevatedButton.styleFrom( //  >> how to make it as a rect?
                backgroundColor: Color(0xFFF48C8C),
                minimumSize: Size(double.infinity, 50),
                
                
              ),
              
              onPressed: calculateBMI,
              child: const Text("CALCULATE", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(height: 10),
            Text("Your BMI: ${bmi.toStringAsFixed(2)}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _genderRow({required IconData icon, required String label, required bool selected}) {
    return GestureDetector(
      onTap: () => setState(() => isMale = (label == "Male")),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF87B1E3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? Color(0xFFF48C8C) : Colors.transparent, width: 3),
        ),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _heightRow() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF87B1E3),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text("Height", style: TextStyle(fontSize: 18, color: Colors.white)),
          Text("${height.toStringAsFixed(1)} cm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          Slider(
            value: height,
            min: 100,
            max: 200,
            activeColor: Color(0xFFF48C8C),
            onChanged: (value) => setState(() => height = value),
          ),
        ],
      ),
    );
  }
  Widget _ageWeighCounter(String label, int value, VoidCallback onIncrement, VoidCallback onDecrement) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF87B1E3),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)),
          Text("$value", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 40, height: 40, decoration: BoxDecoration(color:Color(0xFFF48C8C), borderRadius: BorderRadius.circular(10)) ,
              
                child: IconButton(
                   icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: onDecrement,
                ),
              ),
              SizedBox(width: 10),
              Container(width: 40, height: 40, decoration: BoxDecoration(color:Color(0xFFF48C8C), borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: onIncrement,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



