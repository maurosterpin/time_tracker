import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/database.dart';
import 'package:time_tracker/views/screens/auth/sign_in.dart';
import 'package:time_tracker/views/screens/home_page.dart';

class LandingPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
           if(user == null) {
            return SignInPage.create(context);
          } 
            return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: HomePage());   
          } 
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          
        },
      );
   
    
  }
}