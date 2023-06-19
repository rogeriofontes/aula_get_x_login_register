import 'package:aula_get_x_login_register/app/routes/login_routers.dart';
import 'package:aula_get_x_login_register/app/routes/splash_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/bindings/application_binding.dart';
import 'app/routes/home_routers.dart';
import 'app/routes/product_routers.dart';
import 'app/routes/register_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: ApplicationBinding(),
        initialRoute: '/',
        getPages: [
          ...SplashRoutes.routers,
          ...LoginRouters.routers,
          ...RegisterRouters.routers,
          ...ProductRouters.routers,
          ...HomeRouters.routers,
        ]);
  }
}
