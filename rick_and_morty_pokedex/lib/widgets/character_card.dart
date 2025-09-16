/// CharacterCard widget for Rick and Morty Pokedex
import 'package:flutter/material.dart';
import '../models/character.dart';
import 'entity_badge.dart';

class CharacterCard extends StatelessWidget {
	final Character character;
	final VoidCallback? onTap;

	const CharacterCard({Key? key, required this.character, this.onTap}) : super(key: key);

	Color _statusColor(String status) {
		switch (status.toLowerCase()) {
			case 'alive':
				return Colors.greenAccent;
			case 'dead':
				return Colors.redAccent;
			default:
				return Colors.grey;
		}
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: onTap,
			child: Card(
				color: Colors.black,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
				elevation: 4,
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						Hero(
							tag: 'character-image-${character.id}',
							child: ClipRRect(
								borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
												child: character.image.isNotEmpty
														? Image.network(
																character.image,
																height: 140,
																fit: BoxFit.cover,
																errorBuilder: (context, error, stackTrace) => Container(
																	height: 140,
																	color: Colors.grey[900],
																	child: Icon(Icons.error, color: Colors.redAccent),
																),
																loadingBuilder: (context, child, progress) => progress == null
																		? child
																		: Container(height: 140, color: Colors.grey[900]),
															)
														: Container(
																height: 140,
																color: Colors.grey[900],
																child: Icon(Icons.person, color: Colors.greenAccent),
															),
							),
						),
						Padding(
							padding: const EdgeInsets.all(8.0),
							child: Row(
								children: [
									Expanded(
										child: Text(
											character.name,
											style: TextStyle(
												color: Colors.white,
												fontWeight: FontWeight.bold,
												fontSize: 16,
											),
											overflow: TextOverflow.ellipsis,
										),
									),
									EntityBadge(
										label: character.status,
										color: _statusColor(character.status),
									),
								],
							),
						),
					],
				),
			),
		);
	}
}
