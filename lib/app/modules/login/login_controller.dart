import 'dart:developer';

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import '../../core/constants/constants.dart';
import '../../core/exceptions/user_notfound_exception.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/messages_mixin.dart';
import '../../repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);

      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);
      _loading.toggle();
    } on UserNotfoundException catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Login ou senha inválidos',
          type: MessageType.error));
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar login', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao realizar login',
          type: MessageType.error));
    }
  }
}
