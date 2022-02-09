import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({ Key? key }) : super(key: key);

  List<Widget> _buildChildren() {
    return [
      const TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com'
        ),
      ),
      const SizedBox(height: 8,),
      const TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
      ),
      const SizedBox(height: 8,),
      RaisedButton(
        child: Text('Sign in'),
        onPressed: () {}
        ),
        const SizedBox(height: 8,),
        FlatButton(
          onPressed: () {}, 
          child: Text('Need an account? Register')
          )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}