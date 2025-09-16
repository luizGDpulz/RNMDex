import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/search_provider.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/episode_list_screen.dart'; // Importing EpisodeListScreen for routing
import 'models/character.dart';

class RickAndMortyPokedexApp extends StatelessWidget {
	const RickAndMortyPokedexApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (_) => SearchProvider(),
					child: MaterialApp(
						title: 'RnM Dex',
						debugShowCheckedModeBanner: false,
						theme: ThemeData.dark().copyWith(
							primaryColor: Colors.deepPurple,
							scaffoldBackgroundColor: Colors.black,
							colorScheme: ColorScheme.dark(
								primary: Colors.deepPurple,
								secondary: Colors.greenAccent,
							),
						),
						initialRoute: '/',
						routes: {
							'/': (context) => const HomeScreen(),
							'/search': (context) => const SearchScreen(),
							'/episodes': (context) => const EpisodeListScreen(),
						},
						onGenerateRoute: (settings) {
							if (settings.name == '/detail') {
								final character = settings.arguments as Character;
								return MaterialPageRoute(
									builder: (_) => DetailScreen(character: character),
								);
							}
							return null;
						},
					),
		);
	}
}
