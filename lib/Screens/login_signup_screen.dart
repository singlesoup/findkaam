// import 'dart:convert';

import 'package:findkaam/Models/signupModel.dart';
import 'package:findkaam/Screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import '../Models/loginModel.dart';
import '../constants.dart';

class LoginAndSignUpScreen extends StatefulWidget {
  @override
  _LoginAndSignUpScreenState createState() => _LoginAndSignUpScreenState();
}

class _LoginAndSignUpScreenState extends State<LoginAndSignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email = '';
  String _password = '';
  String _username = '';

  UserType? _usersType;

  bool _signUp = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController psswdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noController = TextEditingController();

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    psswdController.dispose();
    nameController.dispose();
    noController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final node = FocusScope.of(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            reverse: true,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                    child: Text(
                      _signUp ? 'SignUp' : 'Login',
                      style: GoogleFonts.lalezar(
                        textStyle: TextStyle(
                          color: themeColor,
                          // fontFamily: 'Lalezar',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: new EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 3.0),
                              // margin: EdgeInsets.symmetric(vertical: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    activeColor: themeColor,
                                    value: UserType.Seeker,
                                    groupValue: _usersType,
                                    onChanged: (val) {
                                      setState(() {
                                        _usersType = val as UserType?;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Seeker",
                                    style: GoogleFonts.montserrat(
                                      color: _usersType == UserType.Seeker
                                          ? themeColor
                                          : Colors.grey,
                                      fontSize: 16,
                                      fontWeight: _usersType == UserType.Seeker
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(width:40),
                            Container(
                              padding: new EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 3.0),
                              // margin: EdgeInsets.symmetric(vertical: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                // border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: UserType.Recruiter,
                                    activeColor: themeColor,
                                    groupValue: _usersType,
                                    onChanged: (val) {
                                      setState(() {
                                        _usersType = val as UserType?;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Recruiter",
                                    style: GoogleFonts.montserrat(
                                      color: _usersType == UserType.Recruiter
                                          ? themeColor
                                          : Colors.grey,
                                      fontSize: 18,
                                      fontWeight:
                                          _usersType == UserType.Recruiter
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _signUp,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              width: 150,
                              child: TextFormField(
                                //Username
                                controller: nameController,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15),
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: themeColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.grey),
                                  ),
                                  alignLabelWithHint: true,
                                  labelText: 'Name',
                                  labelStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                  hintText: 'Your name goes here',
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.length != 0 ? null : "can't be empty!",

                                onChanged: (val) {
                                  setState(() {
                                    _username = val;
                                  });
                                },
                                onEditingComplete: () => node.nextFocus(),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _signUp,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              width: 150,
                              child: TextFormField(
                                //Number
                                controller: noController,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15),
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: themeColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.grey),
                                  ),
                                  alignLabelWithHint: true,
                                  labelText: 'Number',
                                  labelStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                  hintText: 'Your number goes here',
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (val) =>
                                    val!.length == 10 ? null : 'Invalid Number',

                                onChanged: (val) {
                                  setState(() {
                                    _username = val;
                                  });
                                },
                                onEditingComplete: () => node.nextFocus(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          // email
                          controller: emailController,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15),
                          ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: themeColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey),
                            ),
                            alignLabelWithHint: true,
                            labelText: 'Email',
                            labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                              ),
                            ),
                            hintText: 'Email goes here',
                            hintStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ),
                          validator: (val) => isValidEmail(val!)
                              ? null
                              : 'Please enter a valid email address',
                          onChanged: (val) {
                            setState(() {
                              _email = val;
                            });
                          },
                          onEditingComplete: () => node.nextFocus(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          // password
                          controller: psswdController,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15),
                          ),
                          decoration: InputDecoration(
                            //alignLabelWithHint: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: themeColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: themeColor),
                            ),
                            labelText: 'Password',
                            labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                              ),
                            ),
                            hintText: 'Password goes here',
                            hintStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val!.length < 6 ? 'Password too short !' : null,
                          onChanged: (val) {
                            setState(() {
                              _password = val;
                            });
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          onTap: _signUp
                              ? () async {
                                  if (_formKey.currentState!.validate())
                                    signUp(_usersType);
                                }
                              : () async {
                                  if (_formKey.currentState!.validate())
                                    login(_usersType);
                                },
                          child: Container(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue[400]!,
                                  Colors.purple[400]!
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _signUp ? 'Sign up' : 'Login',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.grey[50],
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _signUp
                              ? 'Already a member? '
                              : "Don't have an account? ",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _signUp = !_signUp;
                              emailController.clear();
                              nameController.clear();
                              psswdController.clear();
                              noController.clear();
                            });
                          },
                          child: Text(
                            _signUp ? 'Login' : 'Register',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: themeColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp(UserType? typ) async {
    print(_username);
    print(_email);
    print(_password);

    String type;
    if (typ == UserType.Recruiter) {
      type = "Recruiter";
    } else {
      type = "Seeker";
    }

    var signUpPost = SignUpModel(
      type: type,
      email: emailController.text,
      name: nameController.text,
      mno: noController.text,
      ps: psswdController.text,
    );

    var body = signUpModelToJson(signUpPost);

    debugPrint(body);
    String url = "https://career-finder.aaratechnologies.in/job/api/signUp";

    // var response =
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {"Content-Type": "application/json;charset=utf-8"},
    ).then((value) {
      print(value.statusCode);
      print(value.body);
      if (value.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      } else {
        throw Exception('Failed to load post!');
      }
    });
  }

  Future login(UserType? typ) async {
    print(_email);
    print(_password);

    String type;
    if (typ == UserType.Recruiter) {
      type = "Recruiter";
    } else {
      type = "Seeker";
    }

    var loginPost = LoginModel(
      type: type,
      email: emailController.text,
      ps: psswdController.text,
    );

    var body = loginModelToJson(loginPost);

    debugPrint(body);

    String url = "https://career-finder.aaratechnologies.in/job/api/login";
    // var response = 
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {"Content-Type": "application/json;charset=utf-8"},
    ).then((value) {
      print(value.statusCode);
      print(value.body);
      if (value.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      } else {
        throw Exception('Failed to load post!');
      }
    });

    // print('\n\n login response code :${response.statusCode}} \n\n');
    // if (response.statusCode == 200) {
    //   var post = LoginModel.fromJson(json.decode(response.body));
    //   // print('\n\n getAllJobs post :$post \n\n');
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (_) => HomeScreen(),
    //     ),
    //   );
    //   return post;
    // } else {
    //   throw Exception('Failed to load post!');
    // }
  }

  showSuccesDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure about that?',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.grey[800],
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.15,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              'No',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.15,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              Navigator.of(context).pop(true);
            },
            child: Text(
              'Yes',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
