import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/resources/assets_helper.dart';
import 'package:movies_app/core/resources/color_helper.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';
import 'package:movies_app/core/resources/size_helper.dart';
import 'package:movies_app/core/utils/strings.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';

import '../../../../core/resources/font_helper.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../component/loading_indicator.dart';
import '../../component/see_all_widget.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return SizedBox(
                height: 400.h, child: const Center(child: LoadingIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.45,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.getNowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () => Navigator.pushNamed(
                          context, RoutePath.movieDetailScreen,
                          arguments: {"movie_id": item.id}),
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0.h,
                              imageUrl: AppConsts.imageUrl(item.backdropPath??""),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: SizeHelper.paddingHeight16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset(AssetsHelper.hotLottie,
                                          width: 20.w, height: 20.h),
                                      SizedBox(width: SizeHelper.paddingWidth4),
                                      Text(
                                        AppStrings.nowPlayingMovies
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: FontSizer.s14,
                                            color: Colors.white),
                                      ),
                                      SizedBox(width: SizeHelper.paddingWidth4),
                                      Lottie.asset(AssetsHelper.hotLottie,
                                          width: 20.w, height: 20.h),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: SizeHelper.paddingHeight16),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: FontSizer.s22,
                                      fontWeight: FontWeight.bold,
                                      color: ColorHelper.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return SizedBox(
                height: 400.h,
                child: Center(child: Text(state.nowPlayingMessage)));
        }
      },
    );
  }
}
