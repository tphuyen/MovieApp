import '../../model/movie.dart';

final List<Movie> movies = [
  Movie.fromMap({
    'imageUrl': 'assets/images/post2.png',
    'title': 'Spiderman: No Way Home',
    'genre':[
      'action',
      'mystery',
      'fantasy',
    ],
    'duration':'1h 47m',
    'rating': 9.1,
  }),

  Movie.fromMap({
    'imageUrl': 'assets/images/post3.png',
    'title': 'Eternals',
    'genre':[
      'horror',
      'thriller',
    ],
    'duration':'1h 47m',
    'rating': 9.5,
  }),

  Movie.fromMap({
    'imageUrl': 'assets/images/post4.png',
    'title': 'Shang-Chi',
    'genre':[
      'action',
      'mystery',
      'fantasy',
    ],
    'duration':'1h 47m',
    'rating': 8.1,
  }),

  Movie.fromMap({
    'imageUrl': 'assets/images/post5.png',
    'title': 'Venom Let There Be Carnage',
    'genre':[
      'horror',
      'mystery',
      'thriller'
    ],
    'duration':'1h 47m',
    'rating': 6.4,
  }),

  Movie.fromMap({
    'imageUrl': 'assets/images/post6.png',
    'title': 'The King\'s Man',
    'genre':[
      'action',
      'fantasy',
    ],
    'duration':'1h 47m',
    'rating': 8.4,
  }),
];