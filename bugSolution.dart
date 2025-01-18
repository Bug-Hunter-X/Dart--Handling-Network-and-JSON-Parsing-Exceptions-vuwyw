```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } on FormatException catch (e) {
        print('Error: Invalid JSON format - $e');
        return null; // Or throw a custom exception
      }
    } else {
      print('Error: HTTP request failed with status - ${response.statusCode}');
      return null; // Or throw a custom exception
    } 
  } on Exception catch (e) {
    print('Error: Network or other exception - $e');
    return null; // Or throw a custom exception
  }
}
```