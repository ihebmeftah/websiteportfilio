// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:websiteportfilio/views/screens/aboutsection.dart';
import 'package:websiteportfilio/views/screens/projectsection.dart';
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
                  child: aboutSection(context: context),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 7,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        myProject(context: context),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.facebook),
                                  onPressed: () {}),
                              IconButton(
                                  icon:
                                      const FaIcon(FontAwesomeIcons.instagram),
                                  onPressed: () {}),
                              IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                                  onPressed: () {}),
                              IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.github),
                                  onPressed: () {}),
                            ],
                          ),
                        )
                      ],
                    ))
              ]),
            )),
      ),
    ));
  }
}
