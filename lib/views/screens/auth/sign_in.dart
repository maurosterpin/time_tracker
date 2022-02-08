import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/sign_in_button.dart';
import '../../../services/auth.dart';
import '../../../widgets/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key, required this.auth }) : super(key: key);
  final AuthBase auth;

  Future <void> _signInAnonymously() async {
    await auth.signInAnonymously();
  }

  Future <void> _signInWithGoogle() async {
    await auth.signInWithGoogle();
  }

   Future <void> _signInWithFacebook() async {
    await auth.signInWithFacebook();
  }

  void _signInWithEmail(BuildContext context) {
    // TODO: Show EmailSignInPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }


Widget _buildContent(BuildContext context) {
  return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          const Text('Sign in', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
          const SizedBox(height: 48,),
          SocialSignInButton(
            text: 'Sign in with Google',
            assetName: 'assets/google-logo.png',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ), 
          SizedBox(height: 8,),
          SocialSignInButton(
            text: 'Sign in with Facebook',
            assetName: 'assets/facebook-logo.png',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: _signInWithFacebook,
          ),
          SizedBox(height: 8,),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Color.fromARGB(255, 51, 146, 87),
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8,),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
            
          ),
          SizedBox(height: 8,),
          SignInButton(
            text: 'Go Anonymus',
            textColor: Colors.black,
            color: Colors.lime,
            onPressed: _signInAnonymously,
          ),
        ]),
      );

      
}
}