// Question: Write a Dart program that finds the largest and smallest numbers in a list.

import 'dart:math';

void main() {
  List<int> numbers = [];

  // fill it with random numbers
  for (int i = 0; i < 10; i++){
    numbers.add(Random().nextInt(100));
  }
  
  // find the largest and smallest numbers
  int largest = numbers.reduce(max);
  int smallest = numbers.reduce(min);

  print('The list of numbers is: $numbers');
  print('The largest number is: $largest');
  print('The smallest number is: $smallest');

}