import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/strings.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_event.dart';
import 'package:movies_app/movies/presentation/screens/widgets/recommendation_series_component.dart';
import 'package:movies_app/movies/presentation/screens/widgets/series_details.dart';
import 'package:movies_app/movies/presentation/screens/widgets/series_details_image.dart';

import '../../../core/resources/font_helper.dart';
import '../../../core/utils/dimen.dart';
import '../../../injections.dart';

class SeriesDetailScreen extends StatefulWidget {
  final int id;

  const SeriesDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<SeriesDetailScreen> createState() => _SeriesDetailScreenState();
}

class _SeriesDetailScreenState extends State<SeriesDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<SeriesDetailsBloc>().initScreen();
      await context
          .read<SeriesDetailsBloc>()
          .getSeriesDetails(seriesId: widget.id);
      await context
          .read<SeriesDetailsBloc>()
          .getRecommendationSeries(recommendationId: widget.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Expanded(flex: 2, child: SeriesDetailsImageComponent()),
            const Expanded(flex: 2, child: SeriesDetailsComponent()),
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
            const Expanded(flex: 2, child: RecommendationSeriesComponent()),
          ]),
        ),
      ),
    );
  }
}
