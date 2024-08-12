import 'dart:io';

void main() async {
  // Read the file content
  final lines = await File('data.txt').readAsLines();
  
  // Store data in a list of maps
  final data = lines.map((line) {
    final parts = line.split(' ');
    return {
      'id': parts[0],
      'time': parts[1],
      'universalTime': parts[1].split(':').map(int.parse).reduce((a, b) => a * 60 + b),
      'event': int.parse(parts[2]),
    };
  }).toList();
  
  print(data);
}
