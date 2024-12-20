
import 'dart:io';
 void main() {
 
  print('enter a year:'); 
  int year = int.parse(stdin.readLineSync()!);
  // 2024%4 == 0, 2024%100 !=0 
  // 1996%400 ==0
  
  if((year%4 == 0 && year%100 != 0) || (year%400 == 0)){ 
    print("$year is a leap year");
  } else {
    print("$year is not a leap year");
  }
  
  //Q2 
  print('/////////////////////');
  // Q2
   print('enter a character');
 String char = stdin.readLineSync()!;
 switch(char){
     case 'a':
       print("vowel");
       break;
      case 'e':
       print("vowel");
       break;
        case 'i':
       print("vowel");
       break;
        case 'o':
       print("vowel");
       break;
        case 'u':
       print("vowel");
       break;
       default:
        print("consonant");
 }
 print('/////////////');
 // Q3
 for (int i = 1; i <= 9; i++) {   // loop for tables 1->9
    print('Multiplication Table of $i:'); 
    //nested loop for each number 1->12 
    for (int j = 1; j <= 12; j++) { 
      int result = i * j;  
      print('$i x $j = $result');
    }
    
    print('');
  }
  
  print('//////////////////');
  //Q4
    for(int i=1; i<=100;i++){
      if(i==37){
          continue;
      }
      print(i);
  }
 

}