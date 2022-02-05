import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2,
      ),
      body: _buildContent()
    );
  }


Widget _buildContent() {
  return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          const Text('Sign in', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
          const SizedBox(height: 8,),
          RaisedButton(
            child: Text('Sign in with Google'), 
            onPressed: () {},
            ),
        ]),
      );

      
}

void _signInWithGoogle() {
    // TODO: Auth with Google
  }
}