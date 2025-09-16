/// EntityBadge widget for Rick and Morty Pokedex
import 'package:flutter/material.dart';

class EntityBadge extends StatelessWidget {
	final String label;
	final Color color;

	const EntityBadge({Key? key, required this.label, required this.color}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
			decoration: BoxDecoration(
				color: color,
				borderRadius: BorderRadius.circular(12),
			),
			child: Text(
				label,
				style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 12,
				),
			),
		);
	}
}
