List divisor(int n){
  var numberList = [1];
  var i = 2;
  while (i <= n ~/ 2)
  {
    if(n % i == 0){
      numberList.add(i);
    }
    i++;
  }
  numberList.add(n);
  return numberList;
}