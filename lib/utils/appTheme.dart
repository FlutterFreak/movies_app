import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_search_app/utils/sizeConfig.dart';

class AppTheme {
  AppTheme._();

  static Color primaryColor = Colors.blue[800];
  static Color primaryDarkColor = Colors.grey[850];
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static Color accentColor = Colors.blue[800];
  static const Color accentDarkColor = Color(0xFFd8414d);
  static Color appBackgroundColor = Colors.grey[900];
  static const Color hintColor = Color(0xFFB7B7B7);
  static const Color textLightBlackColor = Colors.black54;
  static const Color textDarkGreyColor = Color(0xFF848484);
  static const Color textLightGreyColor = Color(0xFF707070);
  static const Color textLightGreenColor = Color(0xFF088108);
  static const Color socialMediaIconColor = Color(0xFF19257C);
  static const Color indigoColor = Color(0xFFD3D3FF);

  static final ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppTheme.appBackgroundColor,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      accentColor: accentColor,
      canvasColor: secondaryColor,
      errorColor: textLightGreenColor,
      appBarTheme: _appBarTheme,
      textTheme: textTheme,
      fontFamily: 'Lato');

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: primaryDarkColor,
    iconTheme: IconThemeData(color: AppTheme.primaryColor),
    textTheme: textTheme.copyWith(
      title: title.copyWith(color: AppTheme.primaryColor),
      subtitle: subTitle.copyWith(color: AppTheme.primaryColor),
    ),
  );

  static final TextTheme textTheme = TextTheme(
    title: title.copyWith(color: AppTheme.primaryColor),
    subtitle: subTitle,
    body1: body1,
    display1: display1,
    display2: display2,
    button: button,
  );

  static final TextStyle title = GoogleFonts.workSans(
      fontSize: 4 * SizeConfig.heightMultiplier, color: Colors.white);

  static final TextStyle subTitle = GoogleFonts.workSans(
      fontSize: 2 * SizeConfig.heightMultiplier, color: Colors.white);

  static final TextStyle body1 = GoogleFonts.workSans(
      fontSize: 3 * SizeConfig.heightMultiplier, color: Colors.white);
  static final TextStyle body2 = GoogleFonts.workSans(
      fontSize: 2.5 * SizeConfig.heightMultiplier, color: Colors.white);
  static final TextStyle display1 = GoogleFonts.workSans(
      fontSize: 2 * SizeConfig.heightMultiplier,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static final TextStyle display2 = GoogleFonts.lato(
    fontSize: 1.5 * SizeConfig.heightMultiplier,
    color: Colors.white,
  );

  static final TextStyle button = GoogleFonts.oswald(
      fontSize: 1.75 * SizeConfig.heightMultiplier,
      color: Colors.white,
      fontWeight: FontWeight.bold);
}
