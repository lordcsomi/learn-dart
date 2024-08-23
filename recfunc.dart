// Question: Implement a Dart function that calculates the factorial of a given number using recursion.

import 'dart:io';

int factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

void main() {
  print('Enter a number:');
  int number = int.parse(stdin.readLineSync()!);

  print('The factorial of $number is ${factorial(number)}');
}