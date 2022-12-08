import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:gamebook/app/bindings/service_binding.dart';
import 'package:gamebook/app/routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  ServiceBinding().dependencies();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.pages,
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark(),
  ));
}

