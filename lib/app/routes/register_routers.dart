import 'package:get/route_manager.dart';

import '../modules/register/register_bindings.dart';
import '../modules/register/register_page.dart';

class RegisterRouters {
  RegisterRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
