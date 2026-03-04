import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/constanst/failure.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/login_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/sign_up_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:flutter_application_1/feature/auth/data/models/forget_password_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/general_response.dart';
import 'package:flutter_application_1/feature/auth/data/models/reset_password_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/verification_code_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(LoginRequest request);
  Future<Either<Failure, AuthResponse>> signUp(SignUpRequest request);
  Future<Either<Failure, generalResponse>> forgetPassword(ForgetPasswordRequest request);
  Future<Either<Failure, generalResponse>>verificationCode (VerificationCodeRequest request);
  Future<Either<Failure, generalResponse>>resetPassword (ResetPasswordRequest request);
}
