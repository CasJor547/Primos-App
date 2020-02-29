import 'dart:math';

List<int> listaPrimos(){
  var primosList = [2];
  var cont = 1;
  var j = 3;

  while(cont < 100){
    if(primo(j) == 1){
        primosList.add(j);
        cont = cont + 1;
        }
        j = j + 2;
  }
  return primosList;
}



int primo(int n) {
  var result = 1; // Un 1 indica que el número si es primo

  if (n % 2 == 0) {
    if (n == 2) {
      return 1;} else {
      result = 0;
      return result;}
  } else {
    var j = 3;
    while (j <= sqrt(n)) {
      if (n % j == 0) {
        result = 0;
        j = n;
      } else {
        j = j + 1;
    }
  }
  return result;
 }
}