import 'package:flutter/material.dart';
import 'package:time_tracker/services/email_sign_in_form_bloc_based.dart';

import 'email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(child: EmailSignInFormBlockBased.create(context)
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}