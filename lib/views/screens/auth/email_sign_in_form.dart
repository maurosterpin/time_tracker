import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
   EmailSignInForm({ Key? key }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    //TODO: print email and password
    print('${_passwordController.text}, ${_emailController.text}');
  }
  

  List<Widget> _buildChildren() {
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
        text: 'Sign in',
        onPressed: _submit
        ),
         SizedBox(height: 8,),
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