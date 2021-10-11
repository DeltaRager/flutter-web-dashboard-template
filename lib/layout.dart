import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/widgets/large_screen.dart';
import 'package:flutter_web_dashboard/widgets/side_menu.dart';

import 'widgets/top_nav.dart';

MaterialColor secondaryBG = const MaterialColor(0xFF1D1C21, const {
  50: const Color(0xFF1D1C21),
  100: const Color(0xFF1D1C21),
  200: const Color(0xFF1D1C21),
  300: const Color(0xFF1D1C21),
  400: const Color(0xFF1D1C21),
  500: const Color(0xFF1D1C21),
  600: const Color(0xFF1D1C21),
  700: const Color(0xFF1D1C21),
  800: const Color(0xFF1D1C21),
  900: const Color(0xFF1D1C21)
});

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      backgroundColor: secondaryBG,
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          )),
    );
  }
}
