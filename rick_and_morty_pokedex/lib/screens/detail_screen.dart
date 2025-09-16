/// Detail screen for Rick and Morty Pokedex
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
		return Scaffold(
			backgroundColor: Colors.black,
			body: CustomScrollView(
				slivers: [
					SliverAppBar(
						expandedHeight: 260,
						backgroundColor: Colors.deepPurple,
						pinned: true,
						flexibleSpace: FlexibleSpaceBar(
							title: Text(c.name, style: TextStyle(color: Colors.greenAccent)),
							background: Hero(
								tag: 'character-image-${c.id}',
								child: Image.network(
									c.image,
									fit: BoxFit.cover,
								),
							),
						),
					),
					SliverToBoxAdapter(
						child: Padding(
							padding: const EdgeInsets.all(16.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text('Status: ${c.status}', style: TextStyle(color: Colors.white)),
									Text('Espécie: ${c.species}', style: TextStyle(color: Colors.white)),
									Text('Tipo: ${c.type.isEmpty ? 'N/A' : c.type}', style: TextStyle(color: Colors.white)),
									Text('Gênero: ${c.gender}', style: TextStyle(color: Colors.white)),
									Text('Origem: ${c.origin['name']}', style: TextStyle(color: Colors.white)),
									Text('Localização: ${c.location['name']}', style: TextStyle(color: Colors.white)),
									SizedBox(height: 16),
									Text('Episódios:', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
									if (_loading)
										Padding(
											padding: const EdgeInsets.all(8.0),
											child: CircularProgressIndicator(color: Colors.greenAccent),
										),
									if (_error.isNotEmpty)
										Text(_error, style: TextStyle(color: Colors.redAccent)),
									..._episodes.map((ep) => ListTile(
												title: Text(ep.name, style: TextStyle(color: Colors.white)),
												subtitle: Text('Primeira aparição: ${ep.airDate}', style: TextStyle(color: Colors.greenAccent)),
												trailing: Text(ep.episode, style: TextStyle(color: Colors.deepPurpleAccent)),
												onTap: () {
													showDialog(
														context: context,
														builder: (_) => AlertDialog(
															backgroundColor: Colors.black,
															title: Text(ep.name, style: TextStyle(color: Colors.greenAccent)),
															content: Text('Episódio: ${ep.episode}\nData: ${ep.airDate}', style: TextStyle(color: Colors.white)),
															actions: [
																TextButton(
																	child: Text('Fechar', style: TextStyle(color: Colors.greenAccent)),
																	onPressed: () => Navigator.pop(context),
																),
															],
														),
													);
												},
											)),
								],
							),
						),
					),
				],
			),
		);
	}
}
