import 'package:flutter_application_1/feature/auth/data/models/auth_request/login_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/sign_up_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/forget_password_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/reset_password_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/verification_code_request.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(LoginInitial());
  final AuthRepo _authRepo;
  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await _authRepo.login(request);
    result.fold(
      (failure) {
        emit(LoginFailure(failure.errMessage));
      },
      (response) {
        emit(LoginSuccess());
      },
    );
  }

  Future<void> signUP(SignUpRequest request) async {
    emit(SignUpLoading());
    var result = await _authRepo.signUp(request);
    result.fold(
      (failure) {
        emit(SignUpFailure(failure.errMessage));
      },
      (response) {
        emit(SignUpSuccess());
      },
    );
  }

  Future<void> forgetPassword(ForgetPasswordRequest request) async {
    emit(ForgetPasswordLoading());
    var result = await _authRepo.forgetPassword(request);
    result.fold(
      (failure) {
        emit(ForgetPasswordFailure(failure.errMessage));
      },
      (response) {
        emit(ForgetPasswordSuccess());
      },
    );
  }

  Future<void> verificationCode(VerificationCodeRequest request) async {
    emit(VerificationCodeLoading());
    var result = await _authRepo.verificationCode(request);
    result.fold(
      (failure) {
        emit(VerificationCodeFailure(failure.errMessage));
      },
      (response) {
        emit(VerificationCodeSuccess());
      },
    );
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordLoading());
    var result = await _authRepo.resetPassword(request);
    result.fold(
      (failure) {
        emit(ResetPasswordFailure(failure.errMessage));
      },
      (response) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
