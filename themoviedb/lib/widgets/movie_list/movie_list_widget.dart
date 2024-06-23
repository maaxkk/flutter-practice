import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: MyAppImages.plus1,
      title: 'The Intouchables',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'IF',
      time: 'May 08, 2024',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'Civil War',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'The Last Kumite',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'Ultraman:rising',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'Tarot',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'Bad Boys for Life',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'The Fall Guy',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
    Movie(
      imageName: MyAppImages.plus1,
      title: 'Dune: Part Two',
      time: 'February 11, 2011',
      description:
          'A true story of two men who should never have met – a quadriplegic aristocrat who was injured in a paragliding accident and a young man from the projects.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchMovies();
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.time,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'A true story of two men who should never have met – a'
                                ' quadriplegic aristocrat who was injured in a '
                                'paragliding accident and a young man from the projects.',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        print(11);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
              labelText: 'Search',
            ),
            controller: _searchController,
          ),
        ),
      ],
    );
  }
}
