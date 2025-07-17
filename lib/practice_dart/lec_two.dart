import 'dart:io';

void main(){
print('enter your age');
String? age=stdin.readLineSync();
if(age!=null){
  int voter=int.parse(age);
  if(voter<18){
    print('you are not eligible');
  }
  else if(voter==18){
    print('you can give vote');
  }
  else{
    print('your are eligible');
  }
}
}