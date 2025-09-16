/// SearchBarRick widget for Rick and Morty Pokedex
import 'package:flutter/material.dart';

class SearchBarRick extends StatelessWidget {
	final TextEditingController controller;
	final ValueChanged<String> onChanged;
	final String hintText;

	const SearchBarRick({
		Key? key,
		required this.controller,
		required this.onChanged,
		this.hintText = 'Buscar personagem...'
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
			decoration: BoxDecoration(
				color: Colors.deepPurple[900],
				borderRadius: BorderRadius.circular(16),
				boxShadow: [
					BoxShadow(
						color: Colors.black26,
						blurRadius: 8,
						offset: Offset(0, 2),
					),
				],
			),
			child: TextField(
				controller: controller,
				onChanged: onChanged,
				style: TextStyle(color: Colors.greenAccent, fontSize: 18),
				decoration: InputDecoration(
					hintText: hintText,
					hintStyle: TextStyle(color: Colors.greenAccent.withOpacity(0.7)),
					border: InputBorder.none,
					prefixIcon: Icon(Icons.search, color: Colors.greenAccent),
				),
			),
		);
	}
}
