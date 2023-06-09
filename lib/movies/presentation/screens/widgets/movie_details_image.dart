import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../component/loading_indicator.dart';
import '../../component/show_full_scren_image.dart';
import '../../controller/movies_details/movie_details_bloc.dart';
import '../../controller/movies_details/movie_details_state.dart';
class MovieDetailsImageComponent extends StatelessWidget {
  const MovieDetailsImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        buildWhen: (previous, current) =>
        previous.movieDetailsState != current.movieDetailsState,
        builder: (context, state) {
          switch (state.movieDetailsState) {
            case RequestState.loading:
              return const Center(
                child: LoadingIndicator(),
              );
            case RequestState.loaded:
                return  TapEffect(
                  onClick: (){
                    showFullScreenImage(
                        context: context,
                        image: AppConsts.imageUrl(
                            state.movieDetailsEntity?.backDropPath??""));
                  },
                  child: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1.0, 1.0],
                        ).createShader(
                          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: AppConsts.imageUrl(
                            state.movieDetailsEntity?.backDropPath??""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
            case RequestState.error:
              return Center(
                child: Text(state.movieDetailsMessage.toString()),
              );
          }
        });
  }
}
