import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key, required this.onSignOut, required this.auth }) : super(key: key);
  final AuthBase auth;
  final VoidCallback onSignOut;

  Future <void> _signOut() async {
    await auth.signOut();
    onSignOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 18),),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}