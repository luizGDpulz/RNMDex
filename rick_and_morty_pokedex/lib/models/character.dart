/// Character model for Rick and Morty Pokedex
class Character {
	final int id;
	final String name;
	final String status;
	final String species;
	final String type;
	final String gender;
	final Map<String, String> origin;
	final Map<String, String> location;
	final String image;
	final List<String> episode;
	final String url;
	final DateTime created;

	Character({
		required this.id,
		required this.name,
		required this.status,
		required this.species,
		required this.type,
		required this.gender,
		required this.origin,
		required this.location,
		required this.image,
		required this.episode,
		required this.url,
		required this.created,
	});

	/// Creates a Character from JSON.
	factory Character.fromJson(Map<String, dynamic> json) {
		return Character(
			id: json['id'],
			name: json['name'],
			status: json['status'],
			species: json['species'],
			type: json['type'],
			gender: json['gender'],
			origin: {
				'name': json['origin']['name'],
				'url': json['origin']['url'],
			},
			location: {
				'name': json['location']['name'],
				'url': json['location']['url'],
			},
			image: json['image'],
			episode: List<String>.from(json['episode']),
			url: json['url'],
			created: DateTime.parse(json['created']),
		);
	}

	/// Converts Character to JSON.
	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'name': name,
			'status': status,
			'species': species,
			'type': type,
			'gender': gender,
			'origin': origin,
			'location': location,
			'image': image,
			'episode': episode,
			'url': url,
			'created': created.toIso8601String(),
		};
	}
}
