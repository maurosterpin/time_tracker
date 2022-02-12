import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/email_sign_in_model.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/widgets/form_submit_button.dart';
import 'package:time_tracker/widgets/showAlertDialog.dart';
import '../../../widgets/show_exception_alert_dialog.dart';
import 'email_sign_in_bloc.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInFormBlockBased extends StatefulWidget {
  EmailSignInFormBlockBased({required this.bloc});
  final EmailSignInBloc bloc;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<EmailSignInBloc>(
      create: (_) => EmailSignInBloc(auth),
      child: Consumer<EmailSignInBloc>(builder: (_, bloc, __) => EmailSignInFormBlockBased(bloc: bloc)),
      dispose: (_, bloc) => bloc.dispose(),
    );
  }
  @override
  State<EmailSignInFormBlockBased> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInFormBlockBased> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
     await widget.bloc.submit();
    Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(context, title: 'Sign in failed', exception: e);
    } 
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _toggleFormType() {
    widget.bloc.toggleFormType();
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren(EmailSignInModel model) {
    final primaryText = model.formType == EmailSignInFormType.signIn ? 'Sign in' : 'Create an account';
    final secondaryText = model.formType == EmailSignInFormType.signIn ? 'Need an account? Register' : 'Have an account? Sign in';
    bool submitEnabled = model.email.isNotEmpty && model.password.isNotEmpty;
    return [
      _buildEmailTextField(model),
       SizedBox(height: 8,),
       _buildPasswordTextField(model),
       SizedBox(height: 8,),
      FormSubmitButton(
        text: primaryText,
        onPressed:!model.isLoading ? _submit : () {}
        ),
         SizedBox(height: 8,),
        FlatButton(
          onPressed: _toggleFormType, 
          child: Text(secondaryText)
          )
    ];
  }

  TextField _buildPasswordTextField(EmailSignInModel model) {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        enabled: model.isLoading == false,
      ),
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField(EmailSignInModel model) {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
        enabled: model.isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EmailSignInModel>(
      stream: widget.bloc.modelStream,
      initialData: EmailSignInModel(),
      builder: (context, snapshot) {
        final EmailSignInModel? model = snapshot.data;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: _buildChildren(model!),
          ),
        );
      }
    );
  }
}