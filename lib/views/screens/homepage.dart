// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:websiteportfilio/views/screens/leftside.dart';
import 'package:websiteportfilio/views/theme/theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      /* appBar: AppBar(
          leading: GetBuilder<Mycontroller>(
        init: Mycontroller(),
        builder: (controller) {
          return Switch(
              value: controller.value,
              onChanged: (v) {
                controller.changeSwitcher();
                ThemeServices().switchTheme();
              });
        },
      )),*/

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Row(children: [
              Expanded(
                flex: 2,
                child: leftSide(context: context),
              ),
              Expanded(
                flex: 7,
                child: Container(),
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
