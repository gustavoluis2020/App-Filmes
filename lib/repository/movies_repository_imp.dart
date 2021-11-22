import 'package:api_movie/model/model.dart';
import 'package:api_movie/repository/movies_repository.dart';
import 'package:api_movie/service/dio_service.dart';
import 'package:api_movie/utils/api_utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = await _dioService.getDio().get(Api.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
