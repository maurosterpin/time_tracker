import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key, required this.onSignOut }) : super(key: key);

  final VoidCallback onSignOut;

  Future <void> _signOut() async {
    await FirebaseAuth.instance.signOut();
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