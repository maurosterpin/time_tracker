import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
   EmailSignInForm({ Key? key }) : super(key: key);

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() {
    //TODO: print email and password
    print('${_passwordController.text}, ${_emailController.text}');
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn ? EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn ? 'Sign in' : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn ? 'Need an account? Register' : 'Have an account? Sign in';
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com'
        ),
        
      ),
       SizedBox(height: 8,),
       TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
      ),
       SizedBox(height: 8,),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit
        ),
         SizedBox(height: 8,),
        FlatButton(
          onPressed: _toggleFormType, 
          child: Text(secondaryText)
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