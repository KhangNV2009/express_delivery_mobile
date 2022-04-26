import '../../constants/core_remote_constants.dart';
import '../models/package/package_create_response.dart';
import '../models/package/package_response.dart';
import 'core_service.dart';

abstract class IPackageService {
  Future<PackageCreateResponse> createPackage({
    required String name,
    required double weight,
    required String category,
    required int warehouseId,
  });

  Future<PackageResponse> getPackages({
    required int state,
    required int warehouseId,
  });
}

class PackageService implements IPackageService {
  CoreService service = CoreService();

  ///Constructors
  static final PackageService _instance = PackageService._internal();

  PackageService._internal();

  factory PackageService() {
    return _instance;
  }

  static const _packages = 'packages';

  @override
  Future<PackageCreateResponse> createPackage({
    required String name,
    required double weight,
    required String category,
    required int warehouseId,
  }) async {
    PackageCreateResponse response = PackageCreateResponse();
    await service.performRequest(
      url: _packages,
      body: {
        'name': name,
        'weight': weight,
        'category': category,
        'warehouseId': warehouseId,
      },
      method: CoreHTTPMethod.post,
      onResponse: (data) {
        response = PackageCreateResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }

  @override
  Future<PackageResponse> getPackages({
    required int state,
    required int warehouseId,
  }) async {
    PackageResponse response = PackageResponse();
    final query = {
      'state': state,
      'warehouseId': warehouseId,
    };
    await service.performRequest(
      url: _packages,
      query: query,
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = PackageResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }
}
