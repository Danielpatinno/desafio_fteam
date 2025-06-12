import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  Future<List<Character>> fetchCharacters({int page = 1, String query = ''}) async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character/?page=$page&name=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar personagens');
    }
  }
}
