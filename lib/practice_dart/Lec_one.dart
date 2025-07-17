// check given number is even or odd..
import 'dart:io';

void main() {
  print('enter your number');
  String? input = stdin.readLineSync();
  if (input != null) {
    int num = int.parse(input);
    if (num % 2 == 0) {
      print('$num is even');
    }
    else {
      print('$num is odd');
    }
  }
}
