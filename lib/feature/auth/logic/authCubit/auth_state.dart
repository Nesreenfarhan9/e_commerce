part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

final class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String errMessage;
  const LoginFailure(this.errMessage);
}

class SignUpInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {
  final String errMessage;
  const SignUpFailure(this.errMessage);
}

class ForgetPasswordInitial extends AuthState {}

class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {}

class ForgetPasswordFailure extends AuthState {
  final String errMessage;
  const ForgetPasswordFailure(this.errMessage);
}


class VerificationCodeInitial extends AuthState {}

class VerificationCodeLoading extends AuthState {}

class VerificationCodeSuccess extends AuthState {}

class VerificationCodeFailure extends AuthState {
  final String errMessage;
  const VerificationCodeFailure(this.errMessage);
}



class ResetPasswordInitial extends AuthState {}

class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordFailure extends AuthState {
  final String errMessage;
  const ResetPasswordFailure(this.errMessage);
}
