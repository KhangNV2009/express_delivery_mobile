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
          Strings.DETAIL_TEXT: 'Chi ti???t',
          Strings.CREATE_TEXT: 'T???o',
          Strings.CANCEL_TEXT: 'Hu???',
          Strings.SEARCH_TEXT: 'T??m ki???m',
          Strings.SAVE_TEXT: 'L??u',
          Strings.ERROR_TEXT: 'L???i',
          Strings.SUCCESS_TEXT: 'Th??nh c??ng',
          Strings.WARNING_TEXT: 'C???nh b??o',
          Strings.COPY_TEXT: 'Sao ch??p',

          /// email
          Strings.EMAIL_TITLE_TEXT: 'Email',
          Strings.EMAIL_HINT_TEXT: 'vidu@email.com',
          Strings.EMAIL_ERROR_TEXT: 'Email kh??ng ????ng ?????nh d???ng',

          /// phone number
          Strings.PHONE_NUMBER_TEXT: 'S??? ??i???n tho???i',
          Strings.PHONE_NUMBER_ERROR_TEXT: 'S??? ??i???n tho???i kh??ng ????ng ?????nh d???ng',

          /// address
          Strings.ADDRESS_TEXT: '?????a ch???',

          /// gender
          Strings.GENDER_TEXT: 'Gi???i t??nh',

          /// year of birth
          Strings.YEAR_OF_BIRTH_TEXT: 'N??m sinh',

          /// google map
          Strings.FIND_ON_GOOGLE_MAP_TEXT: 'T??m tr??n Google Map',
          Strings.WATCH_ON_GOOGLE_MAP_TEXT: 'Xem tr??n Google Map',

          /// full name
          Strings.FULL_NAME_TEXT: 'H??? v?? t??n',

          /// password
          Strings.PASSWORD_TITLE_TEXT: 'M???t kh???u',
          Strings.PASSWORD_HINT_TEXT: 'Nh???p m???t kh???u',
          Strings.NEW_PASSWORD_HINT_TEXT: 'Nh???p m???t kh???u m???i',
          Strings.CONFIRM_PASSWORD_HINT_TEXT: 'X??c nh???n m???t kh???u',
          Strings.PASSWORD_ERROR_TEXT: 'M???t kh???u ph???i l???n h??n 6 k?? t???',
          Strings.CONFIRM_PASSWORD_ERROR_TEXT: 'M???t kh???u kh??ng gi???ng',
          Strings.CREATE_NEW_PASSWORD_TEXT: 'T???o m???t kh???u m???i',
          Strings.INPUT_NEW_PASSWORD_TEXT: 'Nh???p m???t kh???u m???i',
          Strings.CONFIRM_NEW_PASSWORD_TEXT: 'Nh???p l???i m???t kh???u m???i',
          Strings.INPUT_REQUIRED_ERROR_TEXT: 'B???t bu???c nh???p',
          Strings.CURRENT_PASSWORD_TEXT: 'M???t kh???u hi???n t???i',
          Strings.NEW_PASSWORD_TEXT: 'M???t kh???u m???i',
          Strings.CONFIRM_PASSWORD_TEXT: 'X??c nh???n m???t kh???u',

          /// buttons
          Strings.LOGIN_TEXT: '????ng nh???p',
          Strings.REGISTER_TEXT: '????ng k??',
          Strings.CONFIRM_TEXT: 'X??c nh???n',
          Strings.OR_TEXT: 'Ho???c',

          /// Customers
          Strings.CUSTOMER_DETAIL_TEXT: 'Chi ti???t kh??ch h??ng',

          /// Media
          Strings.TAKE_PHOTO_FROM_CAMERA_TEXT: 'Ch???p ???nh',
          Strings.MAKE_VIDEO_FROM_CAMERA_TEXT: 'Quay video',
          Strings.TAKE_PHOTO_FROM_GALLERY_TEXT: 'Ch???n ???nh t??? th?? vi???n',
          Strings.SELECT_VIDEO_FROM_GALLERY: 'Ch???n video t??? th?? vi???n',

          /// Setting
          Strings.LANGUAGE_TEXT: 'Ng??n ng???',
          Strings.TERMS_OF_USE_TEXT: '??i???u kho???n s??? d???ng',
          Strings.PRIVACY_POLICY_TEXT: 'Ch??nh s??ch b???o m???t',
          Strings.ABOUT_EXPRESS_DELIVERY_TEXT: 'V??? Express Delivery',
          Strings.LOG_OUT_TEXT: '????ng xu???t',
          Strings.VERSION_INFO_TEXT: 'Th??ng tin phi??n b???n',

          /// register screen
          Strings.DESCRIPTION_REGISTER_ERROR_TEXT: '????ng k?? th???t b???i, vui l??ng th??? l???i.',

          /// login screen
          Strings.DESCRIPTION_LOGIN_ERROR_TEXT: '????ng nh???p th???t b???i, vui l??ng th??? l???i.',

          /// customer bottom navigation
          Strings.CUSTOMER_HOME_TEXT: 'Trang ch???',
          Strings.CUSTOMER_CHAT_TEXT: 'Tr?? chuy???n',
          Strings.CUSTOMER_NOTIFICATION_TEXT: 'Th??ng b??o',
          Strings.CUSTOMER_MORE_TEXT: 'Th??m',

          /// more
          Strings.SETTING_TEXT: 'C??i ?????t',
          Strings.ACCOUNT_INFO_TEXT: 'Th??ng tin t??i kho???n',
          Strings.FEED_BACK_TEXT: 'Ph???n h???i',

          /// notifications
          Strings.HISTORIES_TEXT: 'L???ch s???',
          Strings.INCIDENTS_TEXT: 'S??? c???',

          /// chat
          Strings.CHAT_TEXT: 'Tr?? chuy???n',

          /// account info
          Strings.CHANGE_PASSWORD_TEXT: '?????i m???t kh???u',
          Strings.CHANGE_LOCATION_TEXT: '?????i ?????a ch???',

          /// home
          Strings.WAREHOUSE_MANAGEMENT_TEXT: 'Qu???n l?? kho h??ng',

          /// warehouse
          Strings.WAREHOUSE_CREATE_TEXT: 'T???o nh?? kho',
          Strings.WAREHOUSE_DETAIL_TEXT: 'Chi ti???t nh?? kho',
          Strings.WAREHOUSE_EDIT_TEXT: 'Ch???nh s???a nh?? kho',
          Strings.WAREHOUSE_NAME_TEXT: 'T??n nh?? kho',
          Strings.SELECT_WAREHOUSE_LOCATION_TEXT: 'Ch???n ?????a ??i???m nh?? kho',
          Strings.CONFIRM_REMOVE_TEXT: 'X??c nh???n x??a',
          Strings.THIS_ACTION_CAN_NOT_BE_UNDONE_TEXT: 'Thao t??c n??y kh??ng th??? ho??n t??c',

          /// select location
          Strings.SELECT_LOCATION_TEXT: 'Ch???n ?????a ??i???m',

          /// book truck
          Strings.CREATE_PACKAGE_TEXT: 'T???o h??ng h??a',
          Strings.SELECT_WAREHOUSE_TEXT: 'Ch???n nh?? kho',
          Strings.BOOK_TRUCK_TEXT: '?????t xe',

          /// package
          Strings.NAME_PACKAGE_TEXT: 'T??n g??i h??ng',
          Strings.WEIGHT_PACKAGE_TEXT: 'Tr???ng l?????ng',
          Strings.CATEGORY_PACKAGE_TEXT: 'Lo???i h??ng',

          /// delivery
          Strings.UNCONFIRMED_DELIVERY_TEXT: '????n h??ng ch??? x??c nh???n',
          Strings.CONFIRMED_DELIVERY_TEXT: '????n h??ng ???? x??c nh???n',
          Strings.IN_TRANSIT_DELIVERY_TEXT: '??ang giao h??ng',
          Strings.SUCCESS_DELIVERY_TEXT: 'Giao h??ng th??nh c??ng',
          Strings.DELIVERY_TEXT: '????n giao h??ng',
          Strings.DELIVERY_DETAIL_TEXT: 'Chi ti???t ????n h??ng',
          Strings.DELIVERY_REPORT_TEXT: 'B??o c??o s??? c???',
          Strings.FROM_TEXT: 'T???',
          Strings.TO_TEXT: '?????n',
          Strings.ORDER_TEXT: '????n h??ng',
          Strings.DELIVERY_PROGRESS_TEXT: 'Ti???n tr??nh giao h??ng',
          Strings.VIEW_ON_GOOGLE_MAP_TEXT: 'Xem tr??n google map',

          ///Greeting
          Strings.HELLO_TEXT: 'Xin ch??o',

          /// chat
          Strings.INPUT_YOUR_MESSAGE_TEXT: 'Nh???p tin nh???n...',
          /// time parsed
          Strings.TIME_AT_TEXT: 'l??c',
        }
      };
}
