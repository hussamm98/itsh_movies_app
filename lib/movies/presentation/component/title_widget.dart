import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/resources/assets_helper.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';

import '../../../core/resources/color_helper.dart';
import '../../../core/resources/font_helper.dart';
import '../../../core/resources/size_helper.dart';
import '../../../core/utils/strings.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        SizeHelper.paddingWidth16,
        SizeHelper.paddingHeight24,
        SizeHelper.paddingWidth16,
        SizeHelper.paddingHeight8,
      ),
      child: Row(
        children: [
          Lottie.asset(AssetsHelper.movieLottie,width: 30.w,height: 30.h),
          SizedBox(width: 4.w,),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: FontSizer.s15,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
              color: ColorHelper.whiteColor,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
