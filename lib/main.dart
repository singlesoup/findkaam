import 'package:flutter/material.dart';

import 'Screens/login_signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primaryColor: themeColor,
          ),
      debugShowCheckedModeBanner: false,
      home: LoginAndSignUpScreen(),
    );
  }
}
