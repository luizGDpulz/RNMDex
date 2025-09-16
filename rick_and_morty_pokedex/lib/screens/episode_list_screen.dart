import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/episode.dart';

class EpisodeListScreen extends StatefulWidget {
  const EpisodeListScreen({Key? key}) : super(key: key);

  @override
  State<EpisodeListScreen> createState() => _EpisodeListScreenState();
}

class _EpisodeListScreenState extends State<EpisodeListScreen> {
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
      final episodes = await api.fetchAllEpisodes();
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Lista de Episódios', style: TextStyle(color: Colors.greenAccent)),
        iconTheme: IconThemeData(color: Colors.greenAccent),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.greenAccent))
          : _error.isNotEmpty
              ? Center(child: Text(_error, style: TextStyle(color: Colors.redAccent)))
              : ListView.builder(
                  itemCount: _episodes.length,
                  itemBuilder: (context, i) {
                    final ep = _episodes[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        color: Colors.deepPurple[900],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(child: Text(ep.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                              SizedBox(height: 8),
                              Center(child: Text('Episódio: ${ep.episode}', style: TextStyle(color: Colors.deepPurpleAccent))),
                              Center(child: Text('Data: ${ep.airDate}', style: TextStyle(color: Colors.greenAccent))),
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
