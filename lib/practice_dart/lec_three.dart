import 'dart:io';

/// print counting number start from 1 to 100.
void main(){
  print('enter your first range number');
  String? num1=stdin.readLineSync();
  String? num2=stdin.readLineSync();
  print('print your last range number');
  if(num1!=null && num2!=null){
    int n1=int.parse(num1);
    int n2=int.parse(num2);
    for(int i=n1;i<n2;i++){
      print('$i');
    }
  }


}