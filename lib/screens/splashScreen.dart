import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_search_app/screens/loginPage.dart';
import 'package:movie_search_app/utils/appTheme.dart';
import 'package:movie_search_app/utils/sizeConfig.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (BuildContext context) => LogIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Shimmer.fromColors(
          baseColor: AppTheme.primaryColor,
          highlightColor: Colors.grey,
          child: new Image.asset(
            'assets/movie.png',
            color: AppTheme.primaryColor,
            height: 20 * SizeConfig.imageSizeMultiplier,
            width: 20 * SizeConfig.imageSizeMultiplier,
          ),
        ),
      ),
    );
  }
}
