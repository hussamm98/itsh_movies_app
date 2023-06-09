import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/presentation/component/see_all_widget.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';
import 'package:movies_app/movies/presentation/screens/widgets/popular_series_component.dart';
import 'package:movies_app/movies/presentation/screens/widgets/top_rated_component.dart';
import 'package:movies_app/movies/presentation/screens/widgets/top_rated_series_component.dart';
import 'package:movies_app/movies/presentation/screens/widgets/upcoming_component.dart';
import '../../../core/resources/font_helper.dart';
import '../../../core/resources/size_helper.dart';
import '../../../core/utils/strings.dart';
import '../component/title_widget.dart';
import 'widgets/now_playing_component.dart';
import 'widgets/popular_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingComponent(),
            const TitleWidget(title: AppStrings.upComingMovies),
            const UpComingComponent(),
            const TitleWidget(title: AppStrings.popularSeries),
            const PopularSeriesComponent(),
            const TitleWidget(title: AppStrings.popularMovies),
            const PopularComponent(),
            const TitleWidget(title: AppStrings.topRatedMovies),
            const TopRatedComponent(),
            const TitleWidget(title: AppStrings.topRatedSeries),
            const TopRatedSeriesComponent(),
            SizedBox(height: SizeHelper.paddingHeight24),
          ],
        ),
      ),
    );
  }
}
