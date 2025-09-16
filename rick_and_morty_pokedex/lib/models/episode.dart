/// Episode model for Rick and Morty Pokedex
class Episode {
	final int id;
	final String name;
	final String airDate;
	final String episode;

	Episode({
		required this.id,
		required this.name,
		required this.airDate,
		required this.episode,
	});

	/// Creates an Episode from JSON.
	factory Episode.fromJson(Map<String, dynamic> json) {
		return Episode(
			id: json['id'],
			name: json['name'],
			airDate: json['air_date'],
			episode: json['episode'],
		);
	}

	/// Converts Episode to JSON.
	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'name': name,
			'air_date': airDate,
			'episode': episode,
		};
	}
}
