import 'dart:async';
import 'package:time_tracker/models/email_sign_in_model.dart';
import 'package:time_tracker/views/screens/auth/email_sign_in_form.dart';

class EmailSignInBloc {
  final StreamController<EmailSignInModel> _modelController = StreamController();
  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  EmailSignInModel _model = EmailSignInModel();

  void dispose() {
    _modelController.close();
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