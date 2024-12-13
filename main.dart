void main(List<String> arguments) {
  //Q1
  print('Hello I\'m \"ZagEng\" ');

  print("///////////////////");
  //Q2
   double alltime= 25/40; //0.625
  
  int hours = 25~/40; //0
 
  
  double rminutes= (alltime-hours)*60; // 0.625*60= 37.5
  int minutes = rminutes.floor();  //  37

  
  double seconds=(rminutes-minutes)*60;  //0.5*60= 30
  
  print('$hours hours, $minutes minutes, $seconds seconds');

  print("///////////////////");
  //Q3
   int input = 10;

      print(input--); //10
      print(input--); //9
      print(input--); //8
      print(input--); //7
      print(input--); //6
      print(input--); //5
      print(input--); //4
      print(input--); //3
      print(input--); //2
      print(input--); //1
      print(input--); //0
  
}
