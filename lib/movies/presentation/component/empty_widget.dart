import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resources/assets_helper.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AssetsHelper.emptyLottie,),
    );
  }
}
