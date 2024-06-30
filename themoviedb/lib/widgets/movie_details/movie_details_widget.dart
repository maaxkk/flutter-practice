import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:themoviedb/widgets/movie_details/novie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'The Intouchables',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1),
        child: ListView(
         children: const [
           MovieDetailsMainInfoWidget(),
           SizedBox(height: 30,),
           MovieDetailsMainScreenCastWidget(),
         ],
        ),
      ),
    );
  }
}
