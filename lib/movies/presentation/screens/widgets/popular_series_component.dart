
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';
import 'package:movies_app/core/resources/size_helper.dart';
import 'package:movies_app/movies/presentation/component/list_animator_data.dart';
import 'package:movies_app/movies/presentation/component/loading_indicator.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';
import 'package:movies_app/movies/presentation/controller/series_bloc/series_state.dart';
import 'package:movies_app/movies/presentation/screens/series_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/color_helper.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../controller/series_bloc/series_bloc.dart';

class PopularSeriesComponent extends StatelessWidget {
  const PopularSeriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
        buildWhen: (previous, current) =>
            previous.popularSeriesState != current.popularSeriesState,
        builder: (context, state) {
          switch (state.popularSeriesState) {
            case RequestState.loading:
              return  SizedBox(
                  height: 170.0.h,
                  child: const Center(child: LoadingIndicator()));
            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0.h,
                  child: ListAnimatorData(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding:  EdgeInsets.symmetric(horizontal: SizeHelper.paddingHeight16),
                    itemCount: state.getPopularSeries.length,
                    itemBuilder: (context, index) {
                      final series = state.getPopularSeries[index];
                      return Container(
                        padding:  EdgeInsets.only(right: SizeHelper.paddingWidth8),
                        child: TapEffect(
                          onClick: ()=> Navigator.pushNamed(
                              context, RoutePath.seriesDetailScreen,
                              arguments: {"series_id": series.id}),
                          child: ClipRRect(
                            borderRadius:
                                 BorderRadius.all(Radius.circular(SizeHelper.radius8)),
                            child: CachedNetworkImage(
                              width: 110.0.w,
                              fit: BoxFit.cover,
                              imageUrl: AppConsts.imageUrl(series.backDropPath??""),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0.h,
                                  width: 120.0.w,
                                  decoration: BoxDecoration(
                                    color: ColorHelper.blackColor,
                                    borderRadius: BorderRadius.circular(SizeHelper.radius8),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                  height: 170.0.h,
                  child: Center(child: Text(state.popularSeriesMessage)));
          }
        });
  }
}
