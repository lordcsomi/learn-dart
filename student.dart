// Question: Create a Dart class named Student with properties for name, age, and grade. Write methods to display the student's details and determine if the student has passed based on the grade (passing grade is 50).

import 'dart:io';

class Student {
  String name;
  int age;
  int grade;

  Student(this.name, this.age, this.grade);

  void displayDetails() {
    print('Name: $name');
    print('Age: $age');
    print('Grade: $grade');
  }

  void hasPassed() {
    if (grade >= 50) {
      print('$name has passed');
    } else {
      print('$name has failed');
    }
  }
}

void main() {
  print('Enter the student\'s name:');
  String name = stdin.readLineSync()!;

  print('Enter the student\'s age:');
  int age = int.parse(stdin.readLineSync()!);

  print('Enter the student\'s grade:');
  int grade = int.parse(stdin.readLineSync()!);

  Student student = Student(name, age, grade);
  student.displayDetails();
  student.hasPassed();
}