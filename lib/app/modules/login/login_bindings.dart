import 'package:aula_get_x_login_register/app/modules/login/login_controller.dart';
import 'package:aula_get_x_login_register/app/repositories/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

import '../../repositories/auth/auth_repository.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find()));

    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
