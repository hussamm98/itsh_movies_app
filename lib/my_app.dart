import 'package:flutter/material.dart';

import 'bloc_providers.dart';
import 'core/resources/color_helper.dart';
import 'core/routes/route.dart';
import 'core/utils/strings.dart';
import 'movies/presentation/screens/main_movies_screen.dart';
import 'movies/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.appRoute});
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        initialRoute: '/',
        onGenerateRoute: appRoute.generateRoute,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorHelper.primaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
