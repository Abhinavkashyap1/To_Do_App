//You are given a list of numbers. Find the sum of all the numbers that are
// divisible by 3.

void main(){
  var  myList=[3,2,7,6,18,13,21];
  int result=myList.where((n) =>n%3==0).reduce((d,e) =>d+e);
  print(result);
}