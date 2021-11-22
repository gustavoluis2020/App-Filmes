import 'package:api_movie/model/model.dart';
import 'package:api_movie/repository/movies_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cacheMovies;

  onChanged(String value) {
    List<Movie> list = _cacheMovies!.listmovies
        .where(
          (e) => e.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    movies.value = movies.value!.copyWith(listmovies: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cacheMovies = movies.value;
  }
}
