import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constanst/api_constanst.dart';
import 'package:flutter_application_1/core/constanst/api_service.dart';
import 'package:flutter_application_1/core/constanst/failure.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/login_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/sign_up_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:flutter_application_1/feature/auth/data/models/forget_password_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/general_response.dart';
import 'package:flutter_application_1/feature/auth/data/models/reset_password_request.dart';
import 'package:flutter_application_1/feature/auth/data/models/verification_code_request.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await apiService.post(
        endpoint: ApiConstanst.loginEndpoint,
        data: loginRequest.toJson(),
      );

      if (response['statusMsg'] == 'fail') {
        return left(
          ServerFailure(response['message'] ?? 'Something went wrong'),
        );
      }

      return Right(AuthResponse.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signUp(
    SignUpRequest signUPRequest,
  ) async {
    try {
      final response = await apiService.post(
        endpoint: ApiConstanst.signUPEndpoint,
        data: signUPRequest.toJson(),
      );

      if (response['statusMsg'] == 'fail') {
        return left(
          ServerFailure(response['message'] ?? 'Something went wrong'),
        );
      }

      return Right(AuthResponse.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, generalResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await apiService.post(
        endpoint: ApiConstanst.forgetPasswordEndpoint,
        data: request.toJson(),
      );

      if (response['statusMsg'] == 'fail') {
        return left(
          ServerFailure(response['message'] ?? 'Something went wrong'),
        );
      }

      return Right(generalResponse.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, generalResponse>> verificationCode(
    VerificationCodeRequest request,
  ) async {
    try {
      final response = await apiService.post(
        endpoint: ApiConstanst.resetCodeEndpoint,
        data: request.toJson(),
      );

      if (response['statusMsg'] == 'fail') {
        return left(
          ServerFailure(response['message'] ?? 'Something went wrong'),
        );
      }

      return Right(generalResponse.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, generalResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await apiService.put(
        endpoint: ApiConstanst.resetPasswordEndpoint,
        data: request.toJson(),
      );

      if (response['statusMsg'] == 'fail') {
        return left(
          ServerFailure(response['message'] ?? 'Something went wrong'),
        );
      }

      return Right(generalResponse.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
