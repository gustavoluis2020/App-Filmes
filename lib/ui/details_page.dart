import 'package:api_movie/model/model.dart';
import 'package:api_movie/utils/api_utils.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.height,
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  Api.REQUEST_IMG(movie.posterPath),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return const CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Titulo: ' + movie.originalTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text(
                'Descrição:  ' + movie.overview,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Text(
              'Data de Lançamento:  ' + movie.releaseDate,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Popularidade:  ' + movie.voteAverage.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Votos:  ' + movie.voteCount.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
