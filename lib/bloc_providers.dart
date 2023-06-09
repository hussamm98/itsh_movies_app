import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injections.dart';
import 'movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'movies/presentation/controller/movies_details/movie_details_bloc.dart';
import 'movies/presentation/controller/series_bloc/series_bloc.dart';
import 'movies/presentation/controller/series_details/series_details_bloc.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      ///// Movies Section /////
      BlocProvider(
          create: (_) => getIt<MoviesBloc>()
            ..getNowPlayingMovies()
            ..getPopularMovies()
            ..getTopRatedMovies()
            ..getUpComingMovies()),
      BlocProvider(
        create: (_) => getIt<MovieDetailsBloc>(),
      ),
      ///// Series Section /////
      BlocProvider(
          create: (_) => getIt<SeriesBloc>()
            ..getPopularSeries()
            ..getTopRatedSeries()),

      BlocProvider(
        create: (_) => getIt<SeriesDetailsBloc>(),
      )
    ], child: child);
  }
}
