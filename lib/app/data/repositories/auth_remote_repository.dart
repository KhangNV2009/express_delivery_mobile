import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/data/models/register/register_request.dart';
import 'package:express_delivery/app/data/models/token/token_response.dart';
import 'package:express_delivery/app/data/models/user/user_response.dart';

import '../models/user/user_avatar_response.dart';
import '../services/auth_service.dart';

class AuthRemoteRepository implements IAuthService {
  final AuthService _accessService = AuthService();

  @override
  Future<TokenResponse> login({
    required String email,
    required String password,
  }) {
    return _accessService.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<TokenResponse> refreshToken() {
    return _accessService.refreshToken();
  }

  @override
  Future<TokenResponse> register({
    required RegisterRequest request,
  }) {
    return _accessService.register(
      request: request,
    );
  }

  @override
  Future<UserResponse> me() {
    return _accessService.me();
  }

  @override
  Future<BaseResponse> updateProfile({
    required String fullName,
    required String phoneNumber,
  }) {
    return _accessService.updateProfile(
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<UserAvatarResponse> updateAvatar({
    required String avatarPath,
  }) {
    return _accessService.updateAvatar(
      avatarPath: avatarPath,
    );
  }

  @override
  Future<BaseResponse> changeLocation({
    required double lat,
    required double lng,
    required String street,
    required String ward,
    required String district,
    required String city,
  }) {
    return _accessService.changeLocation(
      lat: lat,
      lng: lng,
      street: street,
      ward: ward,
      district: district,
      city: city,
    );
  }

  @override
  Future<BaseResponse> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return _accessService.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<BaseResponse> logout() {
    return _accessService.logout();
  }

  @override
  Future<UserResponse> getUserInfo({required int userId}) {
    return _accessService.getUserInfo(userId: userId);
  }
}
