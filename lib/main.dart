import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:websiteportfilio/app/component/app404.dart';
import 'package:websiteportfilio/app/core/themes/appthemes.dart';

import 'app/core/config/appscrolconfig.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
        designSize: const Size(380, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: AppScrollBehavior(),
            title: "Iheb Meftah",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: ThemeMode.dark,
            unknownRoute: GetPage(name: "/404", page: () => const App404()),
          );
        }),
  );
}
