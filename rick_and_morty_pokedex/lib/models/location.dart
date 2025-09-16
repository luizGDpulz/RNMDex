/// Location model for Rick and Morty Pokedex
class Location {
	final int? id;
	final String name;
	final String type;
	final String dimension;

	Location({
		this.id,
		required this.name,
		required this.type,
		required this.dimension,
	});

	/// Creates a Location from JSON.
	factory Location.fromJson(Map<String, dynamic> json) {
		return Location(
			id: json['id'],
			name: json['name'],
			type: json['type'],
			dimension: json['dimension'],
		);
	}

	/// Converts Location to JSON.
	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'name': name,
			'type': type,
			'dimension': dimension,
		};
	}
}
