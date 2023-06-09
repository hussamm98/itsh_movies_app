import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/assets_helper.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/series_details/series_details_state.dart';

import '../../../../core/resources/color_helper.dart';
import '../../../../core/resources/font_helper.dart';
import '../../../../core/resources/size_helper.dart';
import '../../../../core/utils/dimen.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/strings.dart';
import '../../../domain/entity/gener_entity.dart';
import '../../component/loading_indicator.dart';
import '../../component/url_launcher.dart';
import '../../component/web_view.dart';

class SeriesDetailsComponent extends StatelessWidget {
  const SeriesDetailsComponent({Key? key}) : super(key: key);

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
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.all(kPaddingAllScreen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.getTVDetails?.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: FontSizer.s22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          )),
                      SizedBox(height: SizeHelper.paddingHeight8),
                      Text(
                        "${AppStrings.seasons} ${state.getTVDetails?.numberOfSeasons ?? ""}",
                        style: TextStyle(
                          color: ColorHelper.orangeColor,
                          fontSize: FontSizer.s12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: SizeHelper.paddingHeight8),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.0.h,
                              horizontal: 8.0.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius:
                                  BorderRadius.circular(SizeHelper.radius8),
                            ),
                            child: Text(
                              state.getTVDetails?.firstAirDate ?? "",
                              style: TextStyle(
                                fontSize: FontSizer.s14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: SizeHelper.paddingWidth8),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0.h,
                              ),
                              SizedBox(width: SizeHelper.paddingWidth4),
                              Text(
                                (state.getTVDetails?.voteAverage ?? 0)
                                    .toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: FontSizer.s16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(width: SizeHelper.paddingWidth4),
                              Text(
                                '(${state.getTVDetails!.voteAverage})',
                                style: TextStyle(
                                  fontSize: FontSizer.s12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(width: SizeHelper.paddingWidth8),
                              TapEffect(
                                onClick: () =>launchInBrowser(state.getTVDetails?.homePageLink ??"https://google.com",),
                                child: Row(
                                  children: [
                                    Text(
                                      AppStrings.viewOn,
                                      style: TextStyle(
                                          color: ColorHelper.blueColor,
                                          fontSize: FontSizer.s12,
                                          decoration: TextDecoration.underline),
                                    ),
                                    Image.asset(
                                      AssetsHelper.websiteIcon,
                                      scale: 14.w,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: SizeHelper.paddingHeight4),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Text(
                              state.getTVDetails?.overview ?? "",
                              style: TextStyle(
                                fontSize: FontSizer.s13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeHelper.paddingHeight4),
                      Text(
                        '${AppStrings.genres}: ${_showGenres(state.getTVDetails?.genres ?? [])}',
                        style: TextStyle(
                          color: ColorHelper.orangeColor,
                          fontSize: FontSizer.s10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
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

  String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
