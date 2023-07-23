import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:websiteportfilio/app/core/themes/appthemes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: "Iheb Meftah",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            home: child,
          );
        }),
  );
}
