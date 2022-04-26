import 'package:express_delivery/app/data/models/token/token_response.dart';
import 'package:express_delivery/app/data/models/user/user_response.dart';
import 'package:dio/dio.dart' as Dio;

import '../../constants/core_remote_constants.dart';
import '../models/core/base_response.dart';
import '../models/register/register_request.dart';
import '../models/user/user_avatar_response.dart';
import 'core_service.dart';

abstract class IAuthService {
  Future<TokenResponse> refreshToken();

  Future<TokenResponse> login({
    required String email,
    required String password,
  });

  Future<TokenResponse> register({
    required RegisterRequest request,
  });

  Future<UserResponse> me();

  Future<BaseResponse> updateProfile({
    required String fullName,
    required String phoneNumber,
  });

  Future<UserAvatarResponse> updateAvatar({
    required String avatarPath,
  });

  Future<BaseResponse> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<BaseResponse> changeLocation({
    required double lat,
    required double lng,
    required String street,
    required String ward,
    required String district,
    required String city,
  });

  Future<UserResponse> getUserInfo({
    required int userId,
  });

  Future<BaseResponse> logout();
}

class AuthService implements IAuthService {
  CoreService service = CoreService();

  ///Constructors
  static final AuthService _instance = AuthService._internal();

  AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  static const String _auth = 'auth';
  static const String _login = 'login';
  static const String _refreshToken = 'refresh-token';
  static const String _customer = 'customer';
  static const String _register = 'register';
  static const String _me = 'me';
  static const String _avatar = 'avatar';
  static const String _password = 'password';
  static const String _location = 'location';
  static const String _logout = 'logout';
  static const String _user = 'user';

  @override
  Future<TokenResponse> login({
    required String email,
    required String password,
  }) async {
    TokenResponse response = TokenResponse();
    await service.performRequest(
      url: '$_auth/$_login',
      method: CoreHTTPMethod.post,
      body: {
        'email': email,
        'password': password,
      },
      onResponse: (data) {
        response = TokenResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<TokenResponse> refreshToken() async {
    TokenResponse response = TokenResponse();
    await service.performRequest(
      url: '$_auth/$_refreshToken',
      method: CoreHTTPMethod.post,
      onResponse: (data) {
        response = TokenResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<TokenResponse> register({
    required RegisterRequest request,
  }) async {
    TokenResponse response = TokenResponse();
    await service.performRequest(
      url: '$_auth/$_customer/$_register',
      method: CoreHTTPMethod.post,
      body: request,
      onResponse: (data) {
        response = TokenResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<UserResponse> me() async {
    UserResponse response = UserResponse();
    await service.performRequest(
      url: '$_auth/$_me',
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = UserResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> updateProfile({
    required String fullName,
    required String phoneNumber,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_auth/$_me',
      method: CoreHTTPMethod.put,
      body: {
        'fullName': fullName,
        'phoneNumber': phoneNumber,
      },
      onResponse: (data) {
        response = BaseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<UserAvatarResponse> updateAvatar({
    required String avatarPath,
  }) async {
    UserAvatarResponse response = UserAvatarResponse();
    await service.performRequest(
      url: '$_auth/$_me/$_avatar',
      method: CoreHTTPMethod.put,
      body: Dio.FormData.fromMap({
        'avatar': await Dio.MultipartFile.fromFile(
          avatarPath,
          filename: 'avatar.png',
        ),
      }),
      onResponse: (data) {
        response = UserAvatarResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_auth/$_me/$_password',
      method: CoreHTTPMethod.put,
      body: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      },
      onResponse: (data) {
        response = BaseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> changeLocation({
    required double lat,
    required double lng,
    required String street,
    required String ward,
    required String district,
    required String city,
  }) async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_auth/$_me/$_location',
      method: CoreHTTPMethod.put,
      body: {
        'lat': lat,
        'lng': lng,
        'street': street,
        'ward': ward,
        'district': district,
        'city': city,
      },
      onResponse: (data) {
        response = BaseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<BaseResponse> logout() async {
    BaseResponse response = BaseResponse();
    await service.performRequest(
      url: '$_auth/$_logout',
      method: CoreHTTPMethod.post,
      onResponse: (data) {
        response = BaseResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<UserResponse> getUserInfo({
    required int userId,
  }) async {
    UserResponse response = UserResponse();
    await service.performRequest(
      url: '$_auth/$_user/$userId',
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = UserResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }
}
