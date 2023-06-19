import 'package:aula_get_x_login_register/app/modules/register/register_controller.dart';
import 'package:get/get.dart';

import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find()));
    Get.lazyPut(() => RegisterController(authRepository: Get.find()));
  }
}
