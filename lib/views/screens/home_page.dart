import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/job.dart';
import 'package:time_tracker/widgets/showAlertDialog.dart';
import 'package:time_tracker/widgets/show_exception_alert_dialog.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

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
  Future <void> _createJob(BuildContext context) async {
    try {
    final database =  Provider.of<Database>(context, listen: false);
    await database.createJob(Job(name: 'Blogging', ratePerHour: 10));
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context, 
        title: 'Operation failed', 
        exception: e
        );
      }
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
      floatingActionButton: FloatingActionButton(onPressed: () => _createJob(context), child: Icon(Icons.add),),
    );
  }

}