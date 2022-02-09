import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({ Key? key }) : super(key: key);

  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com'
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}