import 'package:flutter/material.dart';
import 'package:movie_search_app/api/apiService.dart';
import 'package:movie_search_app/screens/home.dart';
import 'package:movie_search_app/utils/appTheme.dart';
import 'package:movie_search_app/utils/loading.dart';
import 'package:movie_search_app/utils/sizeConfig.dart';
import 'package:toast/toast.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static FocusNode emailNode;
  static FocusNode passwordNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailNode = FocusNode();
    passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailNode.dispose();
    passwordNode.dispose();
  }

  final emailField = TextFormField(
    focusNode: emailNode,
    controller: emailController,
    obscureText: false,
    style: AppTheme.subTitle,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor),
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
        errorStyle: TextStyle(color: Colors.red),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hoverColor: Colors.grey[300],
        focusColor: Colors.grey[300],
        fillColor: Colors.grey[300],
        hintText: "User Name",
        hintStyle: AppTheme.display2,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor),
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier))),
    validator: (String value) {
      if (value.isEmpty) {
        return 'User name is Empty';
      }
      return null;
    },
  );
  final passwordField = TextFormField(
    controller: passwordController,
    obscureText: true,
    style: AppTheme.subTitle,
    maxLength: 4,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor),
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier)),
        errorStyle: TextStyle(color: Colors.red),
        hoverColor: Colors.grey[300],
        focusColor: Colors.grey[300],
        fillColor: Colors.grey[300],
        counter: Offstage(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        hintStyle: AppTheme.display2,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor),
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier))),
    validator: (String value) {
      if (value.isEmpty) {
        return 'Password is empty!';
      }
      return null;
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10 * SizeConfig.heightMultiplier),
              child: Align(
                alignment: Alignment.topCenter,
                child: new Image.asset(
                  'assets/movie.png',
                  color: AppTheme.primaryColor,
                  height: 25 * SizeConfig.imageSizeMultiplier,
                  width: 20 * SizeConfig.imageSizeMultiplier,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 70 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4 * SizeConfig.heightMultiplier),
                      topRight:
                          Radius.circular(4 * SizeConfig.heightMultiplier)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3 * SizeConfig.widthMultiplier,
                      vertical: 4 * SizeConfig.heightMultiplier),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome',
                          textAlign: TextAlign.left,
                          style: AppTheme.title,
                        ),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                  5 * SizeConfig.heightMultiplier),
                            ),
                            child: emailField),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                  4 * SizeConfig.heightMultiplier),
                            ),
                            child: passwordField),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 50 * SizeConfig.widthMultiplier),
                          child: InkWell(
                            highlightColor: Colors.grey,
                            splashColor: Colors.grey,
                            onTap: () {
                              print('Forgot Password');
                            },
                            child: Text(
                              'Forgot password',
                              textAlign: TextAlign.right,
                              style: AppTheme.display1,
                            ),
                          ),
                        ),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        Center(
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      1.5 * SizeConfig.heightMultiplier)),
                              color: Colors.blue[800],
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (context) => LoadingDialog(),
                                  );
                                  bool isLoggedIn = await login(
                                      emailController.text
                                          .toLowerCase()
                                          .trim()
                                          .toString(),
                                      passwordController.text
                                          .trim()
                                          .toString());

                                  Navigator.of(context).pop();
                                  isLoggedIn
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => MoviesHome()),
                                        )
                                      : Toast.show(
                                          'Invalid Credentials', context,
                                          duration: 2);
                                } else {
                                  Toast.show('Check all Fields', context,
                                      duration: 2);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5 * SizeConfig.widthMultiplier,
                                ),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize:
                                          2.5 * SizeConfig.textMultiplier),
                                ),
                              )),
                        ),
                        SizedBox(height: 5 * SizeConfig.heightMultiplier),
                        Center(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Or login with',
                                textAlign: TextAlign.right,
                                style: AppTheme.display1,
                              ),
                              SizedBox(height: 2 * SizeConfig.heightMultiplier),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/googleLogo.png',
                                  height: 10 * SizeConfig.imageSizeMultiplier,
                                  width: 10 * SizeConfig.imageSizeMultiplier,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
