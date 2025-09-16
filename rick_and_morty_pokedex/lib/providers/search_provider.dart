/// Search provider for Rick and Morty Pokedex
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import '../utils/debounce.dart';

class SearchProvider extends ChangeNotifier {
	final ApiService _apiService = ApiService();
	final Map<String, List<Character>> _cache = {};
	final Debounce _debounce = Debounce(milliseconds: 300);

	List<Character> _results = [];
	List<Character> get results => _results;
	bool _isLoading = false;
	bool get isLoading => _isLoading;
	String _error = '';
	String get error => _error;

	/// Search characters with debounce and cache.
	void search(String query) {
		_debounce.run(() async {
			if (query.isEmpty) {
				_results = [];
				notifyListeners();
				return;
			}
			if (_cache.containsKey(query)) {
				_results = _cache[query]!;
				notifyListeners();
				return;
			}
			_isLoading = true;
			notifyListeners();
			try {
				final characters = await _apiService.fetchCharacters(query, 1);
				_results = characters;
				_cache[query] = characters;
				_error = '';
			} catch (e) {
				_error = 'Erro ao buscar personagens. Tente novamente.';
				_results = [];
			}
			_isLoading = false;
			notifyListeners();
		});
	}

	/// Clear search results.
	void clear() {
		_results = [];
		_error = '';
		notifyListeners();
	}
}
