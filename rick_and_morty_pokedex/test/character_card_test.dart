import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_pokedex/models/character.dart';
import 'package:rick_and_morty_pokedex/widgets/character_card.dart';

void main() {
  testWidgets('CharacterCard displays character name', (WidgetTester tester) async {
    final character = Character(
      id: 1,
      name: 'Rick Sanchez',
      status: 'Alive',
      species: 'Human',
      type: '',
      gender: 'Male',
      origin: {'name': 'Earth', 'url': ''},
      location: {'name': 'Earth', 'url': ''},
  image: '',
      episode: [],
      url: '',
      created: DateTime.now(),
    );
    await tester.pumpWidget(MaterialApp(home: CharacterCard(character: character)));
    expect(find.text('Rick Sanchez'), findsOneWidget);
  });
}
