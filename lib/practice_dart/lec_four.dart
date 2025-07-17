/// Write a function that takes a list of integers and returns the sum
/// of all even numbers in the list.

void main(){
  var myList=[1,2,4,3,6,7,9,11,12,15,16];
  int result=0;
  /// method:1
  /*
  for(int i=0;i<myList.length;i++){

    if(myList[i]%2==0){
      result+=myList[i];
    }
  }

   */
  /// method :2
  result=myList.where((num) => num%2==0).reduce((a,b) => a+b);
  print(result);
}