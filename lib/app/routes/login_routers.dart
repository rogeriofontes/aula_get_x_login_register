import 'package:get/route_manager.dart';

import '../modules/login/login_bindings.dart';
import '../modules/login/login_page.dart';

class LoginRouters {
  LoginRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/login',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
  ];
}
