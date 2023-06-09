import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/strings.dart';
import 'package:movies_app/movies/presentation/controller/movies_details/movie_details_bloc.dart';

import '../../../core/resources/font_helper.dart';
import '../../../core/utils/dimen.dart';
import '../../../injections.dart';
import '../controller/movies_details/movie_details_event.dart';
import 'widgets/movie_details.dart';
import 'widgets/movie_details_image.dart';
import 'widgets/recommendation_component.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<MovieDetailsBloc>().initScreen();
      await context
          .read<MovieDetailsBloc>()
          .getMovieDetails(movieId: widget.id);
      await context
          .read<MovieDetailsBloc>()
          .getRecommendationMovies(recommendationId: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 2, child: MovieDetailsImageComponent()),
              const Expanded(flex: 2, child: MovieDetailsComponent()),
              Padding(
                padding: EdgeInsets.only(left: kPaddingAllScreen),
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    AppStrings.moreLikeThis.toUpperCase(),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: FontSizer.s16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              const Expanded(flex: 2, child: RecommendationComponent()),
            ],
          ),
        ),
      ),
    );
  }
}
