import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/widgets/showAlertDialog.dart';

import '../../services/auth.dart';

class HomePage extends StatelessWidget {

  Future <void> _signOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
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
        _signOut(context);
      }
  }
  void _createJob() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs',),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 18),),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: _createJob, child: Icon(Icons.add),),
    );
  }

}