import 'package:time_tracker/views/screens/auth/email_sign_in_form.dart';

class EmailSignInModel {
  EmailSignInModel({
    this.email = '', 
    this.password = '', 
    this.formType = EmailSignInFormType.signIn, 
    this.isLoading = false, 
    this.submitted = false
    });

  final String email;
  final String password;
  late final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

  EmailSignInModel copyWith({
    String? email,
    String? password,
    EmailSignInFormType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }

}