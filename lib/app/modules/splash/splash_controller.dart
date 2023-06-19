import 'package:get/get.dart';

import '../../services/auth_service.dart';

class SplashController extends GetxController {
  checkedLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
