import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/theme_controller.dart';
import 'package:test_project/common/model/messages.dart';
import 'package:test_project/helper/di_container.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/localization/localization_controller.dart';
import 'package:test_project/theme/dark_theme.dart';
import 'package:test_project/theme/light_theme.dart';
import 'package:test_project/util/app_constants.dart';
import 'package:url_strategy/url_strategy.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  if(GetPlatform.isIOS || GetPlatform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await init();
  if(Platform.isAndroid) {
    await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyAy18gx2tlqjhFDMK9c5v_6fUZngzi1L5c",
        authDomain: "codemoly-e341f.firebaseapp.com",
        projectId: "codemoly-e341f",
        storageBucket: "codemoly-e341f.appspot.com",
        messagingSenderId: "387838626900",
        appId: "1:387838626900:web:5e03d62ee7c0d9412cb1c1",
        measurementId: "G-4C9C27G742"
    ));
  }else{
    await Firebase.initializeApp();
  }

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme:  themeController.darkTheme ? darkTheme : lightTheme,
          locale: localizeController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.getInitialRoute(),
          getPages: RouteHelper.routes,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
      );
    },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}