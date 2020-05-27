import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_search_app/screens/splashScreen.dart';
import 'package:movie_search_app/utils/appTheme.dart';
import 'package:movie_search_app/utils/sizeConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(MoviesApp()),
  );
}

class MoviesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movies',
              theme: AppTheme.appTheme,
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
