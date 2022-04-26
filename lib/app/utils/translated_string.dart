import 'package:get/get.dart';

import 'app_strings.dart';

class TranslatedString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        Strings.ENGLISH: {
          /// CURD
          Strings.DETAIL_TEXT: 'Detail',
          Strings.CREATE_TEXT: 'Create',
          Strings.CANCEL_TEXT: 'Cancel',
          Strings.SEARCH_TEXT: 'Search',
          Strings.SAVE_TEXT: 'Save',
          Strings.ERROR_TEXT: 'Error',
          Strings.SUCCESS_TEXT: 'Success',
          Strings.WARNING_TEXT: 'Warning',
          Strings.COPY_TEXT: 'Copy',

          /// email
          Strings.EMAIL_TITLE_TEXT: 'Email',
          Strings.EMAIL_HINT_TEXT: 'example@email.com',
          Strings.EMAIL_ERROR_TEXT: 'Email is invalid',

          /// phone number
          Strings.PHONE_NUMBER_TEXT: 'Phone number',
          Strings.PHONE_NUMBER_ERROR_TEXT: 'Invalid phone number',

          /// address
          Strings.ADDRESS_TEXT: 'Address',

          /// gender
          Strings.GENDER_TEXT: 'Gender',

          /// year of birth
          Strings.YEAR_OF_BIRTH_TEXT: 'Year of birth',

          /// google map
          Strings.FIND_ON_GOOGLE_MAP_TEXT: 'Find on Google Map',
          Strings.WATCH_ON_GOOGLE_MAP_TEXT: 'Watch on Google Map',

          /// full name
          Strings.FULL_NAME_TEXT: 'Full name',

          /// password
          Strings.PASSWORD_TITLE_TEXT: 'Password',
          Strings.PASSWORD_HINT_TEXT: 'Input your password',
          Strings.NEW_PASSWORD_HINT_TEXT: 'Input new password',
          Strings.CONFIRM_PASSWORD_HINT_TEXT: 'Confirm new password',
          Strings.PASSWORD_ERROR_TEXT: 'Password must be at least 6 characters',
          Strings.CONFIRM_PASSWORD_ERROR_TEXT: 'Confirm password does not match new password',
          Strings.CREATE_NEW_PASSWORD_TEXT: 'Create new password',
          Strings.INPUT_NEW_PASSWORD_TEXT: 'Input new password',
          Strings.CONFIRM_NEW_PASSWORD_TEXT: 'Confirm new password',
          Strings.INPUT_REQUIRED_ERROR_TEXT: 'This field is required',
          Strings.CURRENT_PASSWORD_TEXT: 'Current password',
          Strings.NEW_PASSWORD_TEXT: 'New password',
          Strings.CONFIRM_PASSWORD_TEXT: 'Confirm password',

          /// button
          Strings.LOGIN_TEXT: 'Login',
          Strings.REGISTER_TEXT: 'Register',
          Strings.CONFIRM_TEXT: 'Confirm',
          Strings.OR_TEXT: 'Or',

          /// Media
          Strings.TAKE_PHOTO_FROM_CAMERA_TEXT: 'Take photo',
          Strings.MAKE_VIDEO_FROM_CAMERA_TEXT: 'Make video',
          Strings.TAKE_PHOTO_FROM_GALLERY_TEXT: 'Take photo from gallery',
          Strings.SELECT_VIDEO_FROM_GALLERY: 'Select video from gallery',

          /// Setting
          Strings.LANGUAGE_TEXT: 'Language',
          Strings.TERMS_OF_USE_TEXT: 'Terms of use',
          Strings.PRIVACY_POLICY_TEXT: 'Privacy policy',
          Strings.ABOUT_EXPRESS_DELIVERY_TEXT: 'About Express Delivery',
          Strings.LOG_OUT_TEXT: 'Log out',
          Strings.VERSION_INFO_TEXT: 'Version information',

          /// register screen
          Strings.DESCRIPTION_REGISTER_ERROR_TEXT: 'Register fail, please try again.',

          /// login screen
          Strings.DESCRIPTION_LOGIN_ERROR_TEXT: 'Login fail, please try again.',

          /// customer bottom navigation
          Strings.CUSTOMER_HOME_TEXT: 'Home',
          Strings.CUSTOMER_CHAT_TEXT: 'Chat',
          Strings.CUSTOMER_NOTIFICATION_TEXT: 'Notification',
          Strings.CUSTOMER_MORE_TEXT: 'More',

          /// more
          Strings.SETTING_TEXT: 'Settings',
          Strings.ACCOUNT_INFO_TEXT: 'Account info',
          Strings.FEED_BACK_TEXT: 'Feedback',

          /// notifications
          Strings.HISTORIES_TEXT: 'Histories',
          Strings.INCIDENTS_TEXT: 'Incidents',

          /// chat
          Strings.CHAT_TEXT: 'Chat',

          /// account info
          Strings.CHANGE_PASSWORD_TEXT: 'Change password',
          Strings.CHANGE_LOCATION_TEXT: 'Change location',

          /// home
          Strings.WAREHOUSE_MANAGEMENT_TEXT: 'Warehouse management',

          /// warehouse
          Strings.WAREHOUSE_CREATE_TEXT: 'Create warehouse',
          Strings.WAREHOUSE_DETAIL_TEXT: 'Warehouse detail',
          Strings.WAREHOUSE_EDIT_TEXT: 'Edit warehouse',
          Strings.WAREHOUSE_NAME_TEXT: 'Warehouse name',
          Strings.SELECT_WAREHOUSE_LOCATION_TEXT: 'Select a location for warehouse',
          Strings.CONFIRM_REMOVE_TEXT: 'Confirm remove',
          Strings.THIS_ACTION_CAN_NOT_BE_UNDONE_TEXT: 'This action can not be undone',

          /// select location
          Strings.SELECT_LOCATION_TEXT: 'Select a location',

          /// book truck
          Strings.CREATE_PACKAGE_TEXT: 'Create a packages',
          Strings.SELECT_WAREHOUSE_TEXT: 'Select a warehouse',
          Strings.BOOK_TRUCK_TEXT: 'Book a truck',

          /// package
          Strings.NAME_PACKAGE_TEXT: 'Name package',
          Strings.WEIGHT_PACKAGE_TEXT: 'Weight',
          Strings.CATEGORY_PACKAGE_TEXT: 'Category',

          /// delivery
          Strings.UNCONFIRMED_DELIVERY_TEXT: 'Unconfirmed delivery',
          Strings.CONFIRMED_DELIVERY_TEXT: 'Confirmed delivery',
          Strings.IN_TRANSIT_DELIVERY_TEXT: 'Delivery in transit',
          Strings.SUCCESS_DELIVERY_TEXT: 'Delivery is successfull',
          Strings.DELIVERY_TEXT: 'Delivery',
          Strings.DELIVERY_DETAIL_TEXT: 'Delivery Detail',
          Strings.DELIVERY_REPORT_TEXT: 'Report Trouple',
          Strings.FROM_TEXT: 'From',
          Strings.TO_TEXT: 'To',
          Strings.ORDER_TEXT: 'Order',
          Strings.DELIVERY_PROGRESS_TEXT: 'Delivery Progress',
          Strings.VIEW_ON_GOOGLE_MAP_TEXT: 'View on google map',

          ///Greeting
          Strings.HELLO_TEXT: 'Hello',

          /// chat
          Strings.INPUT_YOUR_MESSAGE_TEXT: 'Input your message...',
          /// time parsed
          Strings.TIME_AT_TEXT: 'at',
        },
        Strings.VIETNAMESE: {
          /// CURD
          Strings.DETAIL_TEXT: 'Chi tiết',
          Strings.CREATE_TEXT: 'Tạo',
          Strings.CANCEL_TEXT: 'Huỷ',
          Strings.SEARCH_TEXT: 'Tìm kiếm',
          Strings.SAVE_TEXT: 'Lưu',
          Strings.ERROR_TEXT: 'Lỗi',
          Strings.SUCCESS_TEXT: 'Thành công',
          Strings.WARNING_TEXT: 'Cảnh báo',
          Strings.COPY_TEXT: 'Sao chép',

          /// email
          Strings.EMAIL_TITLE_TEXT: 'Email',
          Strings.EMAIL_HINT_TEXT: 'vidu@email.com',
          Strings.EMAIL_ERROR_TEXT: 'Email không đúng định dạng',

          /// phone number
          Strings.PHONE_NUMBER_TEXT: 'Số điện thoại',
          Strings.PHONE_NUMBER_ERROR_TEXT: 'Số điện thoại không đúng định dạng',

          /// address
          Strings.ADDRESS_TEXT: 'Địa chỉ',

          /// gender
          Strings.GENDER_TEXT: 'Giới tính',

          /// year of birth
          Strings.YEAR_OF_BIRTH_TEXT: 'Năm sinh',

          /// google map
          Strings.FIND_ON_GOOGLE_MAP_TEXT: 'Tìm trên Google Map',
          Strings.WATCH_ON_GOOGLE_MAP_TEXT: 'Xem trên Google Map',

          /// full name
          Strings.FULL_NAME_TEXT: 'Họ và tên',

          /// password
          Strings.PASSWORD_TITLE_TEXT: 'Mật khẩu',
          Strings.PASSWORD_HINT_TEXT: 'Nhập mật khẩu',
          Strings.NEW_PASSWORD_HINT_TEXT: 'Nhập mật khẩu mới',
          Strings.CONFIRM_PASSWORD_HINT_TEXT: 'Xác nhận mật khẩu',
          Strings.PASSWORD_ERROR_TEXT: 'Mật khẩu phải lớn hơn 6 ký tự',
          Strings.CONFIRM_PASSWORD_ERROR_TEXT: 'Mật khẩu không giống',
          Strings.CREATE_NEW_PASSWORD_TEXT: 'Tạo mật khẩu mới',
          Strings.INPUT_NEW_PASSWORD_TEXT: 'Nhập mật khẩu mới',
          Strings.CONFIRM_NEW_PASSWORD_TEXT: 'Nhập lại mật khẩu mới',
          Strings.INPUT_REQUIRED_ERROR_TEXT: 'Bắt buộc nhập',
          Strings.CURRENT_PASSWORD_TEXT: 'Mật khẩu hiện tại',
          Strings.NEW_PASSWORD_TEXT: 'Mật khẩu mới',
          Strings.CONFIRM_PASSWORD_TEXT: 'Xác nhận mật khẩu',

          /// buttons
          Strings.LOGIN_TEXT: 'Đăng nhập',
          Strings.REGISTER_TEXT: 'Đăng ký',
          Strings.CONFIRM_TEXT: 'Xác nhận',
          Strings.OR_TEXT: 'Hoặc',

          /// Customers
          Strings.CUSTOMER_DETAIL_TEXT: 'Chi tiết khách hàng',

          /// Media
          Strings.TAKE_PHOTO_FROM_CAMERA_TEXT: 'Chụp ảnh',
          Strings.MAKE_VIDEO_FROM_CAMERA_TEXT: 'Quay video',
          Strings.TAKE_PHOTO_FROM_GALLERY_TEXT: 'Chọn ảnh từ thư viện',
          Strings.SELECT_VIDEO_FROM_GALLERY: 'Chọn video từ thư viện',

          /// Setting
          Strings.LANGUAGE_TEXT: 'Ngôn ngữ',
          Strings.TERMS_OF_USE_TEXT: 'Điều khoản sử dụng',
          Strings.PRIVACY_POLICY_TEXT: 'Chính sách bảo mật',
          Strings.ABOUT_EXPRESS_DELIVERY_TEXT: 'Về Express Delivery',
          Strings.LOG_OUT_TEXT: 'Đăng xuất',
          Strings.VERSION_INFO_TEXT: 'Thông tin phiên bản',

          /// register screen
          Strings.DESCRIPTION_REGISTER_ERROR_TEXT: 'Đăng ký thất bại, vui lòng thử lại.',

          /// login screen
          Strings.DESCRIPTION_LOGIN_ERROR_TEXT: 'Đăng nhập thất bại, vui lòng thử lại.',

          /// customer bottom navigation
          Strings.CUSTOMER_HOME_TEXT: 'Trang chủ',
          Strings.CUSTOMER_CHAT_TEXT: 'Trò chuyện',
          Strings.CUSTOMER_NOTIFICATION_TEXT: 'Thông báo',
          Strings.CUSTOMER_MORE_TEXT: 'Thêm',

          /// more
          Strings.SETTING_TEXT: 'Cài đặt',
          Strings.ACCOUNT_INFO_TEXT: 'Thông tin tài khoản',
          Strings.FEED_BACK_TEXT: 'Phản hồi',

          /// notifications
          Strings.HISTORIES_TEXT: 'Lịch sử',
          Strings.INCIDENTS_TEXT: 'Sự cố',

          /// chat
          Strings.CHAT_TEXT: 'Trò chuyện',

          /// account info
          Strings.CHANGE_PASSWORD_TEXT: 'Đổi mật khẩu',
          Strings.CHANGE_LOCATION_TEXT: 'Đổi địa chỉ',

          /// home
          Strings.WAREHOUSE_MANAGEMENT_TEXT: 'Quản lý kho hàng',

          /// warehouse
          Strings.WAREHOUSE_CREATE_TEXT: 'Tạo nhà kho',
          Strings.WAREHOUSE_DETAIL_TEXT: 'Chi tiết nhà kho',
          Strings.WAREHOUSE_EDIT_TEXT: 'Chỉnh sửa nhà kho',
          Strings.WAREHOUSE_NAME_TEXT: 'Tên nhà kho',
          Strings.SELECT_WAREHOUSE_LOCATION_TEXT: 'Chọn địa điểm nhà kho',
          Strings.CONFIRM_REMOVE_TEXT: 'Xác nhận xóa',
          Strings.THIS_ACTION_CAN_NOT_BE_UNDONE_TEXT: 'Thao tác này không thể hoàn tác',

          /// select location
          Strings.SELECT_LOCATION_TEXT: 'Chọn địa điểm',

          /// book truck
          Strings.CREATE_PACKAGE_TEXT: 'Tạo hàng hóa',
          Strings.SELECT_WAREHOUSE_TEXT: 'Chọn nhà kho',
          Strings.BOOK_TRUCK_TEXT: 'Đặt xe',

          /// package
          Strings.NAME_PACKAGE_TEXT: 'Tên gói hàng',
          Strings.WEIGHT_PACKAGE_TEXT: 'Trọng lượng',
          Strings.CATEGORY_PACKAGE_TEXT: 'Loại hàng',

          /// delivery
          Strings.UNCONFIRMED_DELIVERY_TEXT: 'Đơn hàng chờ xác nhận',
          Strings.CONFIRMED_DELIVERY_TEXT: 'Đơn hàng đã xác nhận',
          Strings.IN_TRANSIT_DELIVERY_TEXT: 'Đang giao hàng',
          Strings.SUCCESS_DELIVERY_TEXT: 'Giao hàng thành công',
          Strings.DELIVERY_TEXT: 'Đơn giao hàng',
          Strings.DELIVERY_DETAIL_TEXT: 'Chi tiết đơn hàng',
          Strings.DELIVERY_REPORT_TEXT: 'Báo cáo sự cố',
          Strings.FROM_TEXT: 'Từ',
          Strings.TO_TEXT: 'Đến',
          Strings.ORDER_TEXT: 'Đơn hàng',
          Strings.DELIVERY_PROGRESS_TEXT: 'Tiến trình giao hàng',
          Strings.VIEW_ON_GOOGLE_MAP_TEXT: 'Xem trên google map',

          ///Greeting
          Strings.HELLO_TEXT: 'Xin chào',

          /// chat
          Strings.INPUT_YOUR_MESSAGE_TEXT: 'Nhập tin nhắn...',
          /// time parsed
          Strings.TIME_AT_TEXT: 'lúc',
        }
      };
}
