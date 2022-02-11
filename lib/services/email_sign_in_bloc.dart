import 'dart:async';
import 'package:time_tracker/models/email_sign_in_model.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/views/screens/auth/email_sign_in_form.dart';

class EmailSignInBloc {
  EmailSignInBloc(this.auth);
  final AuthBase auth;
  final StreamController<EmailSignInModel> _modelController = StreamController();

  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  EmailSignInModel _model = EmailSignInModel();

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
    if (_model.formType == EmailSignInFormType.signIn) {
      await auth.signInWithEmailAndPassword(_model.email, _model.password);
    } else {
      await auth.createUserWithEmailAndPassword(_model.email, _model.password);
    }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    } 
  }

  void updateWith({
    String? email,
    String? password,
    EmailSignInFormType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    // update model
    // add update motel to _modelController
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submitted: submitted,
    );
    // add updated model to _modelController
    _modelController.add(_model);
  }
}