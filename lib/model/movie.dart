class Movie{
  final String imageUrl;
  final String title;
  final double rating;
  final List<String> genre;
  final String duration;

  const Movie({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.genre,
    required this.duration,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      imageUrl: map['imageUrl'],
      title: map['title'],
      genre: List<String>.from(map['genre']),
      duration: map['duration'],
      rating: map['rating'],
    );
  }
}