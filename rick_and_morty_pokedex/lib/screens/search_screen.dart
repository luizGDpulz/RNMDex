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
						body: LayoutBuilder(
							builder: (context, constraints) {
								final isWeb = constraints.maxWidth > 600;
								final maxContentWidth = 600.0;
								return SingleChildScrollView(
									padding: const EdgeInsets.all(16.0),
									child: Center(
										child: Container(
											width: isWeb ? maxContentWidth : double.infinity,
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.center,
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
															child: Column(
																children: suggestions.asMap().entries.map((entry) {
																	final i = entry.key;
																	final c = entry.value;
																	return InkWell(
																		borderRadius: BorderRadius.circular(8),
																		onTap: () {
																			Navigator.pushNamed(context, '/detail', arguments: c);
																		},
																		child: Container(
																			padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
																			decoration: BoxDecoration(
																				color: _selectedSuggestion == i ? Colors.deepPurple[600] : Colors.transparent,
																				borderRadius: BorderRadius.circular(8),
																			),
																			child: Row(
																				children: [
																					ClipRRect(
																						borderRadius: BorderRadius.circular(12),
																						child: Image.network(
																							c.image,
																							width: 64,
																							height: 64,
																							fit: BoxFit.cover,
																						),
																					),
																					SizedBox(width: 16),
																					Expanded(
																						child: Text(
																							c.name,
																							style: TextStyle(color: Colors.greenAccent, fontSize: 18, fontWeight: FontWeight.w500),
																						),
																					),
																				],
																			),
																		),
																	);
																}).toList(),
															),
														),
													if (provider.error.isNotEmpty)
														Padding(
															padding: const EdgeInsets.all(8.0),
															child: Text(provider.error, style: TextStyle(color: Colors.redAccent)),
														),
													SizedBox(height: 16),
													provider.results.isEmpty
															? Center(child: Text('Nenhum personagem encontrado.', style: TextStyle(color: Colors.white54)))
															: GridView.builder(
																	shrinkWrap: true,
																	physics: NeverScrollableScrollPhysics(),
																	gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
																		crossAxisCount: isWeb ? 3 : 2,
																		childAspectRatio: isWeb ? 0.9 : 0.7,
																		crossAxisSpacing: 16,
																		mainAxisSpacing: 16,
																	),
																	itemCount: provider.results.length,
																	itemBuilder: (context, i) {
																		final character = provider.results[i];
																		return CharacterCard(
																			character: character,
																			imageSize: 120,
																			onTap: () => Navigator.pushNamed(context, '/detail', arguments: character),
																		);
																	},
																),
												],
											),
										),
									),
								);
							},
						),
			);
	}
}
