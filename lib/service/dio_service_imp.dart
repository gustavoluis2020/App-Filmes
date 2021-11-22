import 'package:api_movie/service/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNjZmOGFiOThmZGM3MDlkYTdjZWVhODFkOWFmM2JjMCIsInN1YiI6IjYxM2Y5MTliMTQ5NTY1MDA0M2ZkMmE0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dsVYxNLJqH3RQSl_OkAMb_01MSA-rE-QAdhqNNL93O4',
      }),
    );
  }
}
