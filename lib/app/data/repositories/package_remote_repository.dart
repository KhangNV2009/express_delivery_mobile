import 'package:express_delivery/app/data/models/package/package_response.dart';
import 'package:express_delivery/app/data/services/package_service.dart';

import '../models/package/package_create_response.dart';

class PackageRemoteRepository implements IPackageService {
  final PackageService _packageService = PackageService();

  @override
  Future<PackageCreateResponse> createPackage({
    required String name,
    required double weight,
    required String category,
    required int warehouseId,
  }) {
    return _packageService.createPackage(
      name: name,
      weight: weight,
      category: category,
      warehouseId: warehouseId,
    );
  }

  @override
  Future<PackageResponse> getPackages({
    required int state,
    required int warehouseId,
  }) {
    return _packageService.getPackages(state: state, warehouseId: warehouseId);
  }
}
