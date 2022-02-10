import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
   EmailSignInForm({ Key? key, required this.auth }) : super(key: key);

   final AuthBase auth;

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() async {
    try {
    if (_formType == EmailSignInFormType.signIn) {
      await widget.auth.signInWithEmailAndPassword(_email, _password);
    } else {
      await widget.auth.createUserWithEmailAndPassword(_email, _password);
    }
    Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
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
      _buildEmailTextField(),
       SizedBox(height: 8,),
       _buildPasswordTextField(),
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

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      textInputAction: TextInputAction.done,
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com'
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
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