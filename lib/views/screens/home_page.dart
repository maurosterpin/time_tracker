import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/widgets/showAlertDialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key, required this.auth }) : super(key: key);
  final AuthBase auth;

  Future <void> _signOut() async {
    await auth.signOut();
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context, 
      title: 'Logout', 
      contant: 'Are you sure you want to logout?', 
      defaultActionText: 'Logout',
      cancelActionText: 'Cancel'
      );
      if(didRequestSignOut == true) {
        _signOut();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 18),),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }
}