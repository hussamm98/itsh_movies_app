import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/presentation/component/tap_effect.dart';

import '../../../core/resources/font_helper.dart';
import '../../../core/resources/size_helper.dart';
import '../../../core/utils/strings.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({Key? key, required this.title, required this.function})
      : super(key: key);
  final String title;
  final VoidCallback function;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: FontSizer.s14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white),
          ),
          TapEffect(
            onClick: function,
            child: Padding(
              padding: EdgeInsets.all(SizeHelper.paddingWidth8),
              child: Row(
                children: [
                  Text(
                    AppStrings.seeMore,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizer.s12,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: FontSizer.s10, color: Colors.white)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
