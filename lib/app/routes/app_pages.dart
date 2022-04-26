import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/language_setting/bindings/language_setting_binding.dart';
import '../modules/language_setting/views/language_setting_view.dart';
import '../modules/main_customer/bindings/main_customer_binding.dart';
import '../modules/main_customer/book_truck/bindings/book_truck_binding.dart';
import '../modules/main_customer/book_truck/customer_package_create/bindings/customer_package_create_binding.dart';
import '../modules/main_customer/book_truck/customer_package_create/views/customer_package_create_view.dart';
import '../modules/main_customer/book_truck/customer_select_warehouse/bindings/customer_select_warehouse_binding.dart';
import '../modules/main_customer/book_truck/customer_select_warehouse/views/customer_select_warehouse_view.dart';
import '../modules/main_customer/book_truck/views/book_truck_view.dart';
import '../modules/main_customer/chat_detail/bindings/customer_chat_detail_binding.dart';
import '../modules/main_customer/chat_detail/views/customer_chat_detail_view.dart';
import '../modules/main_customer/customer_account_info/bindings/customer_account_info_binding.dart';
import '../modules/main_customer/customer_account_info/customer_change_password/bindings/customer_change_password_binding.dart';
import '../modules/main_customer/customer_account_info/customer_change_password/views/customer_change_password_view.dart';
import '../modules/main_customer/customer_account_info/customer_profile/bindings/customer_profile_binding.dart';
import '../modules/main_customer/customer_account_info/customer_profile/views/customer_profile_view.dart';
import '../modules/main_customer/customer_account_info/views/customer_account_info_view.dart';
import '../modules/main_customer/customer_setting/bindings/customer_setting_binding.dart';
import '../modules/main_customer/customer_setting/views/customer_setting_view.dart';
import '../modules/main_customer/views/main_customer_view.dart';
import '../modules/main_customer/warehouse/bindings/warehouse_binding.dart';
import '../modules/main_customer/warehouse/views/warehouse_view.dart';
import '../modules/main_customer/warehouse/warehouse_create/bindings/warehouse_create_binding.dart';
import '../modules/main_customer/warehouse/warehouse_create/views/warehouse_create_view.dart';
import '../modules/main_customer/warehouse/warehouse_detail/bindings/warehouse_detail_binding.dart';
import '../modules/main_customer/warehouse/warehouse_detail/views/warehouse_detail_view.dart';
import '../modules/main_customer/warehouse/warehouse_edit/bindings/warehouse_edit_binding.dart';
import '../modules/main_customer/warehouse/warehouse_edit/views/warehouse_edit_view.dart';
import '../modules/main_driver/bindings/main_driver_binding.dart';
import '../modules/main_driver/chat/driver_chat_detail/bindings/driver_chat_detail_binding.dart';
import '../modules/main_driver/chat/driver_chat_detail/views/driver_chat_detail_view.dart';
import '../modules/main_driver/delivery_detail/bindings/delivery_detail_binding.dart';
import '../modules/main_driver/delivery_detail/driver_create_report/bindings/driver_create_report_binding.dart';
import '../modules/main_driver/delivery_detail/driver_create_report/views/driver_create_report_view.dart';
import '../modules/main_driver/delivery_detail/views/delivery_detail_view.dart';
import '../modules/main_driver/more/driver_profile/bindings/driver_profile_binding.dart';
import '../modules/main_driver/more/driver_profile/views/driver_profile_view.dart';
import '../modules/main_driver/views/main_driver_view.dart';
import '../modules/select_location/bindings/select_location_binding.dart';
import '../modules/select_location/views/select_location_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const LOGIN = Routes.LOGIN;
  static const DRIVER = Routes.MAIN_DRIVER;
  static const CUSTOMER = Routes.MAIN_CUSTOMER;

  static final routes = [
    GetPage(
      name: _Paths.MAIN_CUSTOMER,
      page: () => MainCustomerView(),
      binding: MainCustomerBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_DRIVER,
      page: () => MainDriverView(),
      binding: MainDriverBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_CHAT_DETAIL,
      page: () => CustomerChatDetailView(),
      binding: CustomerChatDetailBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_SETTING,
      page: () => CustomerSettingView(),
      binding: CustomerSettingBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_ACCOUNT_INFO,
      page: () => CustomerAccountInfoView(),
      binding: CustomerAccountInfoBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE_SETTING,
      page: () => LanguageSettingView(),
      binding: LanguageSettingBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_PROFILE,
      page: () => CustomerProfileView(),
      binding: CustomerProfileBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_CHANGE_PASSWORD,
      page: () => CustomerChangePasswordView(),
      binding: CustomerChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE,
      page: () => WarehouseView(),
      binding: WarehouseBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_TRUCK,
      page: () => BookTruckView(),
      binding: BookTruckBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE_CREATE,
      page: () => WarehouseCreateView(),
      binding: WarehouseCreateBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE_DETAIL,
      page: () => WarehouseDetailView(),
      binding: WarehouseDetailBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE_EDIT,
      page: () => WarehouseEditView(),
      binding: WarehouseEditBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_LOCATION,
      page: () => SelectLocationView(),
      binding: SelectLocationBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_PACKAGE_CREATE,
      page: () => CustomerPackageCreateView(),
      binding: CustomerPackageCreateBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_SELECT_WAREHOUSE,
      page: () => CustomerSelectWarehouseView(),
      binding: CustomerSelectWarehouseBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_DETAIL,
      page: () => DeliveryDetailView(),
      binding: DeliveryDetailBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER_CREATE_REPORT,
      page: () => DriverCreateReportView(),
      binding: DriverCreateReportBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER_PROFILE,
      page: () => DriverProfileView(),
      binding: DriverProfileBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER_CHAT_DETAIL,
      page: () => DriverChatDetailView(),
      binding: DriverChatDetailBinding(),
    ),
  ];
}
