// Question: Write a Dart program that simulates downloading a file. Use Future.delayed to simulate the download taking 3 seconds and print a message when the download is complete.

import 'dart:async';

void main() {
  print('Downloading file...');

  Future.delayed(Duration(seconds: 3), () {
    print('Download complete');
  });
}