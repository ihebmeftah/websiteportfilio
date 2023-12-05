import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/themes/appthemes.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello ,",
                      style: TextStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4)),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 50.sp,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4),
                      text: 'I am ',
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Iheb Meftah',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50.sp,
                                color: AppThemes.primaryColor)),
                      ],
                    ),
                  ),
                  Text("Mobile Developer | Flutter Enthusiast",
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4)),
                  Text(
                    "I enjoy exploring new frameworks and tools that enhance the development process and improve the overall user experience.",
                    style: TextStyle(
                        fontSize: 16.sp, color: Colors.grey, height: 1.4.h),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Image.asset("assets/appdevelopment.png", scale: 5.8)
                  .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                      delay: 300.ms)
                  .move(
                      begin: const Offset(10, 10),
                      end: const Offset(-10, -10),
                      duration: const Duration(seconds: 2))
                  .blurXY()
            ],
          ),
        ],
      ),
    );
  }
}
