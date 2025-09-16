/// Home screen for Rick and Morty Pokedex
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.black,
			body: Center(
				child: Padding(
					padding: const EdgeInsets.all(32.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(
								'Pokedex Temática',
								style: TextStyle(
									color: Colors.greenAccent,
									fontSize: 36,
									fontWeight: FontWeight.bold,
									shadows: [
										Shadow(
											color: Colors.deepPurple,
											blurRadius: 8,
											offset: Offset(2, 2),
										),
									],
								),
							),
							SizedBox(height: 24),
							Text(
								'Explore personagens do universo Rick and Morty!\nUse a busca inteligente para encontrar qualquer personagem, local ou episódio.',
								style: TextStyle(
									color: Colors.white,
									fontSize: 18,
								),
								textAlign: TextAlign.center,
							),
							SizedBox(height: 40),
											ElevatedButton.icon(
												style: ElevatedButton.styleFrom(
													backgroundColor: Colors.deepPurple,
													foregroundColor: Colors.greenAccent,
													padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
													shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
												),
												icon: Icon(Icons.search),
												label: Text('Pesquisar Personagens'),
												onPressed: () => Navigator.pushNamed(context, '/search'),
											),
											SizedBox(height: 20),
											ElevatedButton.icon(
												style: ElevatedButton.styleFrom(
													backgroundColor: Colors.greenAccent,
													foregroundColor: Colors.deepPurple,
													padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
													shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
												),
												icon: Icon(Icons.tv),
												label: Text('Ver Lista de Episódios'),
												onPressed: () => Navigator.pushNamed(context, '/episodes'),
											),
						],
					),
				),
			),
		);
	}
}
