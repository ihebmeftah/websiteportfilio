import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websiteportfilio/views/screens/homepage.dart';
import 'package:websiteportfilio/views/theme/theme.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}

Future<void> navDelay() async {
  await Future.delayed(const Duration(seconds: 3));
  Get.to(Homepage());
}
