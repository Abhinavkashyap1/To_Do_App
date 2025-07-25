import 'dart:convert';

import 'package:http/http.dart' as http;

/// all todo api call will be here....

class TodoServices{
static Future<bool>deleteById(String id)async{
  /// delete the item
  final url = 'https://api.nstack.in/v1/todos/$id';
  final uri = Uri.parse(url);
  final response = await http.delete(uri);
  return response.statusCode==200;
}
static Future<List?>fetchTodos() async{
  final url = 'https://api.nstack.in/v1/todos?page=2&limit=20';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map;
    final result = json['items'] as List;
    return result;
  }
  else{
    return null;
  }
}
}