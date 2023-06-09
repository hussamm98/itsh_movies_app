import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/component/show_full_scren_image.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_state.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../component/loading_indicator.dart';

class SeriesDetailsImageComponent extends StatelessWidget {
  const SeriesDetailsImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
        buildWhen: (previous, current) =>
            previous.tvStateDetailsState != current.tvStateDetailsState,
        builder: (context, state) {
          switch (state.tvStateDetailsState) {
            case RequestState.loading:
              return const Center(
                child: LoadingIndicator(),
              );
            case RequestState.loaded:
              return TapEffect(
                onClick: () {
                  showFullScreenImage(
                    context: context,
                    image:
                        AppConsts.imageUrl(state.getTVDetails?.backDropPath??""),
                  );
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
                      imageUrl:
                          AppConsts.imageUrl(state.getTVDetails?.backDropPath??""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(state.tvMessage.toString()),
              );
          }
        });
  }
}
