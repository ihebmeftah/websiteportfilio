import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:websiteportfilio/app/modules/intro/views/intro_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
      controller: controller.scrollController,
      thickness: 5,
      child: PageView(
        padEnds: false,
        allowImplicitScrolling: true,
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        children: const [
          IntroView(),
          Text("data 2 "),
          Text("data 3 "),
          Text("data 3 "),
        ],
      ),
    ));
  }
}
