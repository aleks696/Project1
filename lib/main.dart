import 'package:flutter/material.dart';

class Student {
  // Private variables
  String _name;
  String _lastname;

  // Named parameter constructor
  Student({String name = '', String lastname = ''})
      : _name = name,
        _lastname = lastname;

  // Get names from private variables
  String get name => _name;
  String get lastname => _lastname;

  // Set names to private variables
  set name(String name) => _name = name;
  set lastname(String lastname) => _lastname = lastname;
}

void main() {
  // Create an object of the class Student using constructor and named parameters
  var student = Student(name: 'Tania', lastname: 'Oleksiienko');

  // Print names sing getters
  print('First Name: ${student.name}');
  print('Last name: ${student.lastname}');

  // Change names using setters
  student.name = 'Olena';
  student.lastname = 'Petrenko';

  // Print new set names 
  print('New First Name: ${student.name}');
  print('New Last name: ${student.lastname}');
}
