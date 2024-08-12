// szimulációt kell készíteni az ön által választott programozási nyelvben: Van egy cégnek 2 db kamionja. N darab (10 - 30 db) doboz érkezik egyesével egy futószalagon mindegyiknek súlya 20- 80 kg (szimulálja a random súlyokat) majd döntse el hogy melyik kamionba kell rakni a dobozt hogy a kamionok súlya egyenlő legyen (nagyjából) ezt úgy tudja elérni hogy a könnyebb összsúlyú kamionba kell rakni az éppen a futószalagon érkező dobozt

import 'dart:math';

void main(){
  int numberOfBoxes = Random().nextInt(21) + 10;
  print('NUmber of boxes: $numberOfBoxes');
  
  List <int> truck1 = [];
  List <int> truck2 = [];
  int truck1Weight = 0;
  int truck2Weight = 0;

  for (int i = 1; i < numberOfBoxes+1; i++){
    // simulating the weight of the boxes
    int boxWeight = Random().nextInt(61) + 20;
    if (truck1Weight <= truck2Weight){
      truck1.add(boxWeight);
      truck1Weight += boxWeight;
    } else {
      truck2.add(boxWeight);
      truck2Weight += boxWeight;
    }
    // Print the decision process
    print('Box $i with weight $boxWeight kg assigned to ${truck1Weight <= truck2Weight ? "Truck 1" : "Truck 2"}');
  }
  print('Truck 1: $truck1 with a total weight of $truck1Weight');
  print('Truck 2: $truck2 with a total weight of $truck2Weight');
}