import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import '../models/episode.dart';

class DetailScreen extends StatefulWidget {
	final Character character;
	const DetailScreen({Key? key, required this.character}) : super(key: key);

	@override
	State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
	List<Episode> _episodes = [];
	bool _loading = true;
	String _error = '';

	@override
	void initState() {
		super.initState();
		_fetchEpisodes();
	}

	Future<void> _fetchEpisodes() async {
		try {
			final api = ApiService();
			final episodes = <Episode>[];
			for (final url in widget.character.episode.take(5)) {
				final ep = await api.fetchEpisode(url);
				episodes.add(ep);
			}
			setState(() {
				_episodes = episodes;
				_loading = false;
			});
		} catch (e) {
			setState(() {
				_error = 'Erro ao carregar episódios.';
				_loading = false;
			});
		}
	}

	@override
	Widget build(BuildContext context) {
						final c = widget.character;
						return LayoutBuilder(
							builder: (context, constraints) {
								final isWeb = constraints.maxWidth > 600;
								final maxContentWidth = 600.0;
								return Scaffold(
									backgroundColor: Colors.black,
									body: CustomScrollView(
										slivers: [
											SliverAppBar(
												expandedHeight: 300,
												backgroundColor: Colors.deepPurple,
												pinned: true,
												flexibleSpace: FlexibleSpaceBar(
													title: null,
													background: Center(
														child: Hero(
															tag: 'character-image-${c.id}',
															child: Container(
																width: 300,
																height: 300,
																decoration: BoxDecoration(
																	border: Border.all(color: Colors.greenAccent, width: 4),
																	boxShadow: [
																		BoxShadow(
																			color: Colors.deepPurple.withOpacity(0.5),
																			blurRadius: 16,
																			offset: Offset(0, 6),
																		),
																	],
																	borderRadius: BorderRadius.circular(24),
																),
																child: ClipRRect(
																	borderRadius: BorderRadius.circular(18),
																	child: AspectRatio(
																		aspectRatio: 1,
																		child: Image.network(
																			c.image,
																			fit: BoxFit.cover,
																		),
																	),
																),
															),
														),
													),
												),
											),
											SliverToBoxAdapter(
												child: Center(
													child: Container(
														width: isWeb ? maxContentWidth : double.infinity,
														child: Padding(
															padding: const EdgeInsets.all(16.0),
															child: Column(
																crossAxisAlignment: CrossAxisAlignment.center,
																children: [
																	Text(
																		c.name,
																		style: TextStyle(
																			color: Colors.greenAccent,
																			fontSize: 24,
																			fontWeight: FontWeight.bold,
																			shadows: [
																				Shadow(
																					color: Colors.deepPurple,
																					blurRadius: 8,
																					offset: Offset(2, 2),
																				),
																			],
																		),
																		textAlign: TextAlign.center,
																	),
																	SizedBox(height: 16),
																	Center(child: Text('Status: ${c.status}', style: TextStyle(color: Colors.white))),
																	Center(child: Text('Espécie: ${c.species}', style: TextStyle(color: Colors.white))),
																	Center(child: Text('Tipo: ${c.type.isEmpty ? 'N/A' : c.type}', style: TextStyle(color: Colors.white))),
																	Center(child: Text('Gênero: ${c.gender}', style: TextStyle(color: Colors.white))),
																	Center(child: Text('Origem: ${c.origin['name']}', style: TextStyle(color: Colors.white))),
																	Center(child: Text('Localização: ${c.location['name']}', style: TextStyle(color: Colors.white))),
																	SizedBox(height: 24),
																	Center(child: Text('Episódios:', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold))),
																	if (_loading)
																		Padding(
																			padding: const EdgeInsets.all(8.0),
																			child: Center(child: CircularProgressIndicator(color: Colors.greenAccent)),
																		),
																	if (_error.isNotEmpty)
																		Center(child: Text(_error, style: TextStyle(color: Colors.redAccent))),
																	..._episodes.map((ep) => Padding(
																		padding: const EdgeInsets.symmetric(vertical: 4.0),
																		child: Center(
																			child: Card(
																				color: Colors.deepPurple[900],
																				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
																				child: Padding(
																					padding: const EdgeInsets.all(8.0),
																					child: Column(
																						crossAxisAlignment: CrossAxisAlignment.center,
																						children: [
																							Center(child: Text(ep.name, style: TextStyle(color: Colors.white))),
																							Center(child: Text('Primeira aparição: ${ep.airDate}', style: TextStyle(color: Colors.greenAccent))),
																							Center(child: Text(ep.episode, style: TextStyle(color: Colors.deepPurpleAccent))),
																						],
																					),
																				),
																			),
																		),
																	)),
																],
															),
														),
													),
												),
											),
										],
									),
								);
							},
						);
					}
				}
