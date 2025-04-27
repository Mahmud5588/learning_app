import 'package:learnig_app/core/network/api_urls.dart';
import 'package:learnig_app/core/network/dio_client.dart';
import 'package:learnig_app/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:learnig_app/features/authentication/data/model/api_response_model.dart';
import 'package:learnig_app/features/authentication/data/model/token_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;
  final Talker _talker = TalkerFlutter.init();

  AuthRemoteDataSourceImpl(this._dioClient);


  //HandleResponse
  Future<ApiResponseModel> _handleResponse(Future<dynamic> request) async {
    try {
      final response = await request;
      _talker.info("API response received: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        _talker.debug("Response Data: ${response.data}");
        return ApiResponseModel.fromJson(response.data);
      } else {
        _talker.error(
          "Request failed with status code: ${response.statusCode}",
        );
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e, st) {
      _talker.handle(e, st);
      throw Exception('Request failed: $e');
    }
  }


  //RegisterEmail
  @override
  Future<ApiResponseModel> registerEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return _handleResponse(
      _dioClient.post(
        Urls.authRegisterEmail,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
        },
      ),
    );
  }

  //RegisterPhone
  @override
  Future<ApiResponseModel> registerPhone({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    return _handleResponse(
      _dioClient.post(
        Urls.authRegisterPhone,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber": phoneNumber,
          "password": password,
        },
      ),
    );
  }

  //login
  @override
  Future<AccessTokenModel> login({
    required String username,
    required String password,
  }) async {
    final response = await _dioClient.post(
      Urls.authLogin,
      data: {"username": username, "password": password},
    );
    _talker.info("API response received: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      _talker.debug("Response Data: ${response.data}");
      return AccessTokenModel.fromJson(response.data);
    } else {
      _talker.error("Request failed with status code: ${response.statusCode}");
      throw Exception('Failed with status code: ${response.statusCode}');
    }
  }


  //logout
  @override
  Future<ApiResponseModel> logout() async {
    return _handleResponse(_dioClient.post(Urls.authLogout, data: {}));
  }


  //otp verification
  @override
  Future<ApiResponseModel> otpVerification({required String otp,required String userId}) async {
    return _handleResponse(
      _dioClient.post(Urls.authOtpVerifications, data: {"otp": otp,"userId":userId}),
    );
  }


  //refresh token
  @override
  Future<AccessTokenModel> refreshToken({required String refreshToken}) async {
    try {
      final response = await _dioClient.post(
        Urls.authRefreshToken,
        data: {"refreshToken": refreshToken},
      );
      _talker.info("API response received: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        _talker.debug("Response Data: ${response.data}");
        return AccessTokenModel.fromJson(response.data);
      } else {
        _talker.error(
          "Request failed with status code: ${response.statusCode}",
        );
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      _talker.handle(e);
      rethrow;
    }
  }


  //reset password
  @override
  Future<ApiResponseModel> resetPassword({
    required String otp,
    required List<String> newPassword,
    required List<String> confirmPassword,
  }) async {
    return _handleResponse(
      _dioClient.post(
        Urls.authResetPassword,
        data: {
          "otp": otp,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        },
      ),
    );
  }


  @override
  Future<ApiResponseModel> resetPasswordEmail({required String email}) async {
    return _handleResponse(
      _dioClient.post(Urls.authResetPasswordEmail, data: {"email": email}),
    );
  }

  @override
  Future<ApiResponseModel> resetPasswordPhone({required String phone}) async {
    return _handleResponse(
      _dioClient.post(Urls.authResetPasswordPhone, data: {"phone": phone}),
    );
  }

  @override
  Future<ApiResponseModel> grandCode({required String code}) async {
    return _handleResponse(
      _dioClient.post(Urls.authGrantCode, data: {"code": code}),
    );
  }
}
