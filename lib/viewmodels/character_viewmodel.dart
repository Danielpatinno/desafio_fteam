import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../services/api_service.dart';

final characterViewModelProvider = StateNotifierProvider<CharacterViewModel, AsyncValue<List<Character>>>(
  (ref) => CharacterViewModel(),
);

class CharacterViewModel extends StateNotifier<AsyncValue<List<Character>>> {
  final ApiService _apiService = ApiService();

  List<Character> _characters = [];

  int _currentPage = 1;
  String _currentQuery = '';

  List<Character> get favorites {
    return _characters.where((c) => c.isFavorite).toList();
  }

  CharacterViewModel() : super(const AsyncValue.loading()) {
    loadCharacters();
  }

  Future<void> loadCharacters({String query = ''}) async {
    _currentPage = 1;
    _currentQuery = query;
    state = const AsyncValue.loading();

    try {
      _characters = await _apiService.fetchCharacters(query: query, page: _currentPage);
      state = AsyncValue.data(_characters);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  } 

  Future<void> loadNextPage() async {
    _currentPage++;
    try {
      final newChars = await _apiService.fetchCharacters(query: _currentQuery, page: _currentPage);
      _characters.addAll(newChars);
      state = AsyncValue.data(_characters);
    } catch (_) {
      _currentPage--; 
    }
  }

  void toggleFavorite(int id) {
    _characters = _characters.map((char) {
      if (char.id == id) {
        return char.copyWith(isFavorite: !char.isFavorite);
      }
      return char;
    }).toList();
    state = AsyncValue.data(_characters);
  }
}
