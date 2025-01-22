import 'package:movie_app/model/movie.dart';

final List<Map<String, dynamic>> moviesJson = [
  {
    'imageUrl': 'assets/images/post2.png',
    'title': 'Spiderman: No Way Home',
    'genre': ['action', 'mystery', 'fantasy'],
    'duration': '1h 47m',
    'rating': 9.1,
    'language': 'English',
    'age': '13+',
    'description': 'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. '
        'When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
    'filmBgTrailer': 'assets/images/film_bg_trailer_2.png',
    'cast': [
      {'imageUrl': 'assets/images/act5.png', 'name': 'Tom Holland'},
      {'imageUrl': 'assets/images/act6.png', 'name': 'Zendaya'},
      {'imageUrl': 'assets/images/act7.png', 'name': 'Benedict Cumberbatch'},
      {'imageUrl': 'assets/images/act8.png', 'name': 'Jacon Batalon'},
    ]
  },
  {
    'imageUrl': 'assets/images/post3.png',
    'title': 'Eternals',
    'genre': ['fantasy', 'action'],
    'duration': '1h 47m',
    'rating': 9.5,
    'language': 'English',
    'age': '13+',
    'description': 'The Eternals, a race of immortal beings, must reunite to protect Earth from the Deviants, '
        'a monstrous species long thought extinct but now threatening the safety of the planet.',
    'filmBgTrailer': 'assets/images/film_bg_trailer_3.jpg',
    'cast': [
      {'imageUrl': 'assets/images/act1.png', 'name': 'Tom Holland'},
      {'imageUrl': 'assets/images/act2.png', 'name': 'Zendaya'},
      {'imageUrl': 'assets/images/act3.png', 'name': 'Benedict Cumberbatch'},
      {'imageUrl': 'assets/images/act4.png', 'name': 'Jacon Batalon'},
    ]
  },
  {
    'imageUrl': 'assets/images/post4.png',
    'title': 'Shang-Chi',
    'genre': ['action', 'mystery', 'fantasy'],
    'duration': '1h 47m',
    'rating': 8.1,
    'language': 'Mandarin, English',
    'age': '13+',
    'description': 'Shang-Chi, the master of unarmed weaponry-based Kung Fu, is forced to confront his past after '
        'being drawn into the Ten Rings organization led by his father.',
    'filmBgTrailer': 'assets/images/film_bg_trailer_4.jpg',
    'cast': [
      {'imageUrl': 'assets/images/act1.png', 'name': 'Tom Holland'},
      {'imageUrl': 'assets/images/act2.png', 'name': 'Zendaya'},
      {'imageUrl': 'assets/images/act3.png', 'name': 'Benedict Cumberbatch'},
      {'imageUrl': 'assets/images/act4.png', 'name': 'Jacon Batalon'},
    ]
  },
  {
    'imageUrl': 'assets/images/post5.png',
    'title': 'Venom Let There Be Carnage',
    'genre': ['horror', 'mystery', 'thriller'],
    'duration': '1h 47m',
    'rating': 6.4,
    'language': 'English',
    'age': '16+',
    'description': 'Eddie Brock struggles to coexist with the shape-shifting extraterrestrial Venom. '
        'When serial killer Cletus Kasady also becomes host to an alien symbiote, Brock and Venom must stop his reign of terror.',
    'filmBgTrailer': 'assets/images/film_bg_trailer_5.jpg',
    'cast': [
      {'imageUrl': 'assets/images/act1.png', 'name': 'Tom Holland'},
      {'imageUrl': 'assets/images/act2.png', 'name': 'Zendaya'},
      {'imageUrl': 'assets/images/act3.png', 'name': 'Benedict Cumberbatch'},
      {'imageUrl': 'assets/images/act4.png', 'name': 'Jacon Batalon'},
    ]
  },
  {
    'imageUrl': 'assets/images/post6.png',
    'title': 'The King\'s Man',
    'genre': [
      'action',
      'fantasy',
    ],
    'duration': '1h 47m',
    'rating': 8.4,
    'language': 'English',
    'age': '17+',
    'description': 'As a collection of history\'s worst tyrants and criminal masterminds gather to plot a war to wipe out millions, '
        'one man must race against time to stop them in the origin story of the Kingsman agency.',
    'filmBgTrailer': 'assets/images/film_bg_trailer_6.jpg',
    'cast': [
      {'imageUrl': 'assets/images/act1.png', 'name': 'Tom Holland'},
      {'imageUrl': 'assets/images/act2.png', 'name': 'Zendaya'},
      {'imageUrl': 'assets/images/act3.png', 'name': 'Benedict Cumberbatch'},
      {'imageUrl': 'assets/images/act4.png', 'name': 'Jacon Batalon'},
    ]
  },
];
final List<Movie> movies = moviesJson.map((json) => Movie.fromJson(json)).toList();