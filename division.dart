// Question: Write a Dart function that takes two integers as input and returns their division result. Handle any potential division by zero errors with appropriate exception handling.

import 'dart:io';

double divide(int a, int b) {
  if (b == 0) {
    throw Exception('Division by zero error');
  }
  return a / b;
}

void main() {
  print('Enter the first number:');
  int a = int.parse(stdin.readLineSync()!);

  print('Enter the second number:');
  int b = int.parse(stdin.readLineSync()!);

  try {
    double result = divide(a, b);
    print('The division result is: $result');
  } catch (e) {
    print('Error: $e');
  }
}