import 'package:api_movie/model/model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
