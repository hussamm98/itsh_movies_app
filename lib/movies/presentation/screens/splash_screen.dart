import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_helper.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';

import 'main_movies_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AssetsHelper.cinemaPNG,
      splashIconSize: MediaQuery.of(context).size.width*0.9,
      nextScreen: const MainMoviesScreen(),
      centered: true,
      splashTransition: SplashTransition.decoratedBoxTransition,
    );
  }
}
