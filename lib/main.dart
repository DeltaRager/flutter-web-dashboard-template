import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/pages/404/error.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routing/routes.dart';

MaterialColor fontColor = const MaterialColor(0xFFD3BC91, const {
  50: const Color(0xFFD3BC91),
  100: const Color(0xFFD3BC91),
  200: const Color(0xFFD3BC91),
  300: const Color(0xFFD3BC91),
  400: const Color(0xFFD3BC91),
  500: const Color(0xFFD3BC91),
  600: const Color(0xFFD3BC91),
  700: const Color(0xFFD3BC91),
  800: const Color(0xFFD3BC91),
  900: const Color(0xFFD3BC91)
});

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: authenticationPageRoute,
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(
            name: authenticationPageRoute, page: () => AuthenticationPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.staatlichesTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: fontColor),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      // home: AuthenticationPage(),
    );
  }
}
