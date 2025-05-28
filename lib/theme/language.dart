import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello!',
      'welcome': 'Welcome to my app',
      'login': 'Login',
      'logout': 'Logout',
      'province': 'Province',
      'district': 'District',
      'provinceList': 'Province List',
      'setting': 'Setting',
      'user_info': 'User Info',
    },
    'vi_VN': {
      'hello': 'Xin chào!',
      'welcome': 'Chào mừng đến với ứng dụng của tôi',
      'login': 'Đăng nhập',
      'logout': 'Đăng xuất',
      'province': 'Tỉnh',
      'district': 'Quận',
      'provinceList': 'Danh sách tỉnh',
      'setting': 'Cài đặt',
      'user_info': 'Thông tin người dùng',
    },
  };
}
