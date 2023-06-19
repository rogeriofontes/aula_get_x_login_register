import 'package:get/route_manager.dart';

import '../modules/splash/splash_bindings.dart';
import '../modules/splash/splash_page.dart';

class SplashRoutes {
  SplashRoutes._();

  static final routers = <GetPage>[
    GetPage(name: '/', binding: SplashBinding(), page: () => const SplashPage())
  ];
}
