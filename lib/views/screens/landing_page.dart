import 'package:flutter/material.dart';
import 'package:time_tracker/views/screens/auth/sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const SignInPage();
  }
}