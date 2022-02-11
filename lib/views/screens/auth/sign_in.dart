import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/views/screens/auth/email_sign_in_page.dart';
import 'package:time_tracker/views/screens/auth/sign_in_block.dart';
import 'package:time_tracker/widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker/widgets/sign_in_button.dart';
import '../../../services/auth.dart';
import '../../../widgets/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(),
      child: SignInPage(),
    );
  }
  
  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException && exception.code != 'ERROR_ABORTED_BY_USER') {
    showExceptionAlertDialog(context, title: 'Sign in failed', exception: exception);
    }
  }

  Future <void> _signInAnonymously(BuildContext context) async {
      final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
      bloc.setIsLoading(true);
    final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      bloc.setIsLoading(false);
    }
  }

  Future <void> _signInWithGoogle(BuildContext context) async {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
       bloc.setIsLoading(true);
    final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
       bloc.setIsLoading(false);
    }
  }

   Future <void> _signInWithFacebook(BuildContext context) async {
     final bloc = Provider.of<SignInBloc>(context, listen: false);
     try {
        bloc.setIsLoading(true);
     final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
       bloc.setIsLoading(false);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
        )
    ); 
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2,
      ),
      body: StreamBuilder<bool>(
        stream: bloc.isLoadingStream,
        initialData: false,
        builder: (context, snapshot) {
          return _buildContent(context, snapshot.data);
        }
      ),
      backgroundColor: Colors.grey[200],
    );
  }

Widget _buildContent(BuildContext context, bool? isLoading) {
  return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50,child: _buildHeader(isLoading!)),
          const SizedBox(height: 48,),
          SocialSignInButton(
            text: 'Sign in with Google',
            assetName: 'assets/google-logo.png',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? () => null : () => _signInWithGoogle(context),
          ), 
          SizedBox(height: 8,),
          SocialSignInButton(
            text: 'Sign in with Facebook',
            assetName: 'assets/facebook-logo.png',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: isLoading ? () => null : () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8,),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Color.fromARGB(255, 51, 146, 87),
            onPressed: isLoading ? () => null : () => _signInWithEmail(context),
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
            onPressed: isLoading ? () => null : () => _signInAnonymously(context),
          ),
        ]),
      );

      
}

Widget _buildHeader(bool isLoading) {
  if(isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return const Text('Sign in', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),textAlign: TextAlign.center,);
  }
}
}