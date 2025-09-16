/// API service for Rick and Morty Pokedex
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';
import '../models/location.dart';
import '../models/episode.dart';

class ApiService {
	static const String baseUrl = 'https://rickandmortyapi.com/api';
	final http.Client client;

	ApiService({http.Client? client}) : client = client ?? http.Client();

	/// Fetches characters by query and page, with error handling and retry.
	Future<List<Character>> fetchCharacters(String query, int page) async {
		final url = Uri.parse('$baseUrl/character/?name=$query&page=$page');
		int retries = 0;
		while (retries < 3) {
			try {
				final response = await client.get(url);
				if (response.statusCode == 200) {
					final data = json.decode(response.body);
					return (data['results'] as List)
							.map((json) => Character.fromJson(json))
							.toList();
				} else if (response.statusCode == 404) {
					return [];
				} else {
					throw Exception('Failed to load characters');
				}
			} catch (e) {
				retries++;
				await Future.delayed(Duration(milliseconds: 500 * retries));
				if (retries == 3) rethrow;
			}
		}
		return [];
	}

	/// Fetches a character by ID.
	Future<Character> fetchCharacterById(int id) async {
		final url = Uri.parse('$baseUrl/character/$id');
		final response = await client.get(url);
		if (response.statusCode == 200) {
			return Character.fromJson(json.decode(response.body));
		} else {
			throw Exception('Failed to load character');
		}
	}

	/// Fetches a location by URL.
	Future<Location> fetchLocation(String url) async {
		final response = await client.get(Uri.parse(url));
		if (response.statusCode == 200) {
			return Location.fromJson(json.decode(response.body));
		} else {
			throw Exception('Failed to load location');
		}
	}

	/// Fetches an episode by URL.
	Future<Episode> fetchEpisode(String url) async {
		final response = await client.get(Uri.parse(url));
		if (response.statusCode == 200) {
			return Episode.fromJson(json.decode(response.body));
		} else {
			throw Exception('Failed to load episode');
		}
	}
}
