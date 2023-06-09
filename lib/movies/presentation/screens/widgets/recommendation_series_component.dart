import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_state.dart';
import 'package:movies_app/movies/presentation/screens/series_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/size_helper.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimen.dart';
import '../../../../core/utils/enums.dart';
import '../../component/loading_indicator.dart';

class RecommendationSeriesComponent extends StatelessWidget {
  const RecommendationSeriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        switch (state.recommendationSeriesState) {
          case RequestState.loading:
            return const Center(
              child: LoadingIndicator(),
            );
          case RequestState.loaded:
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingAllScreen),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 18.h,
                    crossAxisSpacing: 18.w),
                itemCount: state.recommendationSeriesEntity.length,
                itemBuilder: (BuildContext context, int index) => TapEffect(
                  onClick: () => Navigator.pushReplacementNamed(
                      context, RoutePath.seriesDetailScreen,
                      arguments: {"series_id": state.recommendationSeriesEntity[index].id}),
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(SizeHelper.radius8)),
                      child: CachedNetworkImage(
                        imageUrl: AppConsts.imageUrl(state
                            .recommendationSeriesEntity[index].backDropPath!),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(SizeHelper.radius8)),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          case RequestState.error:
            return Center(
              child: Text(state.recommendationSeriesMessage.toString()),
            );
        }
      },
    );
  }
}
