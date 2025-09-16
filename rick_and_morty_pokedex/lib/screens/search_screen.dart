/// Search screen for Rick and Morty Pokedex
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../widgets/search_bar_rick.dart';
import '../widgets/character_card.dart';

class SearchScreen extends StatefulWidget {
	const SearchScreen({Key? key}) : super(key: key);

	@override
	State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
	final TextEditingController _controller = TextEditingController();
	int _selectedSuggestion = -1;

	@override
	Widget build(BuildContext context) {
		final provider = Provider.of<SearchProvider>(context);
		final suggestions = provider.results.take(8).toList();
		return Scaffold(
			backgroundColor: Colors.black,
			appBar: AppBar(
				backgroundColor: Colors.deepPurple,
				title: Text('Buscar Personagem', style: TextStyle(color: Colors.greenAccent)),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						SearchBarRick(
							controller: _controller,
							onChanged: (q) {
								provider.search(q);
								setState(() => _selectedSuggestion = -1);
							},
						),
						if (provider.isLoading)
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: CircularProgressIndicator(color: Colors.greenAccent),
							),
						if (suggestions.isNotEmpty && _controller.text.isNotEmpty)
							Container(
								margin: EdgeInsets.only(top: 8),
								decoration: BoxDecoration(
									color: Colors.deepPurple[800],
									borderRadius: BorderRadius.circular(12),
								),
								child: ListView.builder(
									shrinkWrap: true,
									itemCount: suggestions.length,
									itemBuilder: (context, i) {
										final c = suggestions[i];
										return ListTile(
											title: Text(c.name, style: TextStyle(color: Colors.greenAccent)),
											onTap: () {
												Navigator.pushNamed(context, '/detail', arguments: c);
											},
											selected: _selectedSuggestion == i,
										);
									},
								),
							),
						if (provider.error.isNotEmpty)
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: Text(provider.error, style: TextStyle(color: Colors.redAccent)),
							),
						Expanded(
							child: GridView.builder(
								gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
									crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
									childAspectRatio: 0.7,
									crossAxisSpacing: 12,
									mainAxisSpacing: 12,
								),
								itemCount: provider.results.length,
								itemBuilder: (context, i) {
									final character = provider.results[i];
									return CharacterCard(
										character: character,
										onTap: () => Navigator.pushNamed(context, '/detail', arguments: character),
									);
								},
							),
						),
					],
				),
			),
		);
	}
}
