import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/route_path.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/movies/presentation/screens/main_movies_screen.dart';
import 'package:movies_app/movies/presentation/screens/series_detail_screen.dart';

import '../../movies/presentation/screens/splash_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutePath.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePath.mainMoviesScreen:
        return MaterialPageRoute(builder: (_) => const MainMoviesScreen());
      case RoutePath.movieDetailScreen:
        return MaterialPageRoute(
            builder: (_) => MovieDetailScreen(id: arguments?['movie_id']));
      case RoutePath.seriesDetailScreen:
        return MaterialPageRoute(
            builder: (_) => SeriesDetailScreen(id: arguments?['series_id']));
    }
    return null;
  }
}
