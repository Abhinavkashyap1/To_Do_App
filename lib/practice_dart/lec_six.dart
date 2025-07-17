/// Count how many odd numbers are present in the list.

void main(){
  var myList=[2,3,5,8,11,13,16,17,19,21,23];
  /// filter odd numbers using where
  var oddNum=myList.where((i) =>i%2!=0);
  /// count them using length
  int result=oddNum.length;
  /// print theresult
  print(result);
}