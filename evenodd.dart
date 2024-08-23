// Question: Create a Dart program that checks if a given number is even or odd.

import 'dart:io';

void main () {
  print('Enter a number:');

  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print('$number is an even number');
  } else {
    print('$number is an odd number');
  }

}