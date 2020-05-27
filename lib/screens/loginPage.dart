import 'package:flutter/material.dart';
import 'package:movie_search_app/utils/appTheme.dart';
import 'package:movie_search_app/utils/sizeConfig.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static FocusNode emailNode;
  static FocusNode passwordNode;

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

  final emailField = TextField(
    focusNode: emailNode,
    controller: emailController,
    obscureText: false,
    style: AppTheme.subTitle,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        hintStyle: AppTheme.display2,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier))),
  );
  final passwordField = TextField(
    controller: passwordController,
    obscureText: true,
    style: AppTheme.subTitle,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        hintStyle: AppTheme.display2,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(4 * SizeConfig.heightMultiplier))),
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
                  height: 20 * SizeConfig.imageSizeMultiplier,
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
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(
                                4 * SizeConfig.heightMultiplier),
                          ),
                          child: emailField),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(
                                4 * SizeConfig.heightMultiplier),
                          ),
                          child: passwordField),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 65 * SizeConfig.widthMultiplier),
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
                            onPressed: () {
//                              Navigator.of(context).push(
//                                MaterialPageRoute(builder: (_) => Loading()),
//                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5 * SizeConfig.widthMultiplier,
                              ),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 2.5 * SizeConfig.textMultiplier),
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
                              child: Image.asset('assets/googleLogo.png'),
                            )
                          ],
                        ),
                      )
                    ],
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
