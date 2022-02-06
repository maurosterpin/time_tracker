import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/views/screens/auth/sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User? _user;

  @override
  Widget build(BuildContext context) {
    if(_user == null) {
        return const SignInPage();
    } else {
      return Container();
    }
    
  }
}