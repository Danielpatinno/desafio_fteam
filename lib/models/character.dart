class Character {
  final int id;
  final String name;
  final String species;
  final String image;
  final String gender;
  final String status;
  final String origin;
  final String location;
  final List<String> episode;
  bool isFavorite;

  Character({
    required this.id,
    required this.name,
    required this.species,
    required this.image,
    required this.gender,
    required this.status,
    required this.origin,
    required this.location,
    required this.episode,
    this.isFavorite = false,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      image: json['image'],
      gender: json['gender'],
      status: json['status'],
      origin: json['origin']['name'] ?? '',
      location: json['location']['name'] ?? '',
      episode: List<String>.from(json['episode'] ?? []),
    );
  }

  Character copyWith({bool? isFavorite}) {
    return Character(
      id: id,
      name: name,
      species: species,
      image: image,
      gender: gender,
      status: status,
      origin: origin,
      location: location,
      episode: episode,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
