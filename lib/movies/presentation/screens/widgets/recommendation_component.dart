import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';
import 'package:movies_app/core/resources/size_helper.dart';
import 'package:movies_app/movies/presentation/component/empty_widget.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routes/route_path.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimen.dart';
import '../../../../core/utils/enums.dart';
import '../../component/loading_indicator.dart';
import '../../component/show_full_scren_image.dart';
import '../../controller/movies_details/movie_details_bloc.dart';
import '../../controller/movies_details/movie_details_state.dart';

class RecommendationComponent extends StatelessWidget {
  const RecommendationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.recommendationMovieState) {
          case RequestState.loading:
            return const Center(
              child: LoadingIndicator(),
            );
          case RequestState.loaded:
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingAllScreen),
              child: state.recommendationMovieEntity.isEmpty
                  ? const EmptyWidget()
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 18.h,
                          crossAxisSpacing: 18.w),
                      itemCount: state.recommendationMovieEntity.length,
                      itemBuilder: (BuildContext context, int index) =>
                          TapEffect(
                        onClick: ()=>Navigator.pushReplacementNamed(
                        context, RoutePath.movieDetailScreen,
                        arguments: {"movie_id": state.recommendationMovieEntity[index].id}),
                        child: FadeInUp(
                          from: 20,
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(SizeHelper.radius8)),
                            child: CachedNetworkImage(
                              imageUrl: AppConsts.imageUrl(state
                                  .recommendationMovieEntity[index]
                                  .backDropPath!),
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
              child: Text(state.recommendationMovieMessage.toString()),
            );
        }
      },
    );
  }
}
