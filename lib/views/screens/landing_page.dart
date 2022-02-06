import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/views/screens/auth/sign_in.dart';
import 'package:time_tracker/views/screens/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User? _user;

  @override
  void initState() {
    super.initState();
    _updateUser(FirebaseAuth.instance.currentUser);
  }

  void _updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }

  void _logOutUser() {
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null) {
        return SignInPage(
          onSignIn: _updateUser,
        );
    } else {
      return HomePage(
        onSignOut: _logOutUser,
      );
    }
    
  }
}