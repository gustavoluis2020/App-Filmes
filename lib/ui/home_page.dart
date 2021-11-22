import 'package:api_movie/controller/movie_controller.dart';
import 'package:api_movie/model/model.dart';
import 'package:api_movie/repository/movies_repository_imp.dart';
import 'package:api_movie/service/dio_service_imp.dart';

import 'package:api_movie/widgets/custom_list_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            ValueListenableBuilder<Movies?>(
              valueListenable: _controller.movies,
              builder: (__, movies, _) {
                return Visibility(
                  visible: movies != null,
                  child: Column(
                    children: [
                      Text(
                        'Filmes',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Card(
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: TextField(
                          textAlign: TextAlign.left,
                          cursorColor: Colors.grey,
                          cursorHeight: 30,
                          cursorWidth: 5.0,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: _controller.onChanged,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              },
            ),
            Flexible(
              child: ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: movies.listmovies.length,
                          itemBuilder: (_, idx) =>
                              CustomListCard(movie: movies.listmovies[idx]),
                          separatorBuilder: (_, __) => const Divider(
                            color: Colors.transparent,
                          ),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
