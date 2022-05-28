import 'package:flutter/material.dart';
import 'package:websiteportfilio/views/screens/widgets/coding.dart';
import 'package:websiteportfilio/views/screens/widgets/knowledge.dart';
import 'package:websiteportfilio/views/screens/widgets/me.dart';
import 'package:websiteportfilio/views/screens/widgets/personalinfo.dart';
import 'package:websiteportfilio/views/screens/widgets/skills.dart';
import 'package:websiteportfilio/views/theme/theme.dart';

Widget leftSide({required BuildContext? context}) => Drawer(
      child: Column(
        children: [
          info(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  persoInfo(title: 'Residence', value: 'Tunisia'),
                  persoInfo(title: 'City', value: 'Gabés'),
                  persoInfo(title: 'Age', value: '22'),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      'Skills : ',
                      style: Theme.of(context!).textTheme.subtitle2,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: skills(
                            context: context, label: 'Flutter', perc: 0.8),
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: skills(
                            context: context, label: 'Firebase', perc: 0.7),
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: skills(
                            context: context, label: 'Laravel', perc: 0.5),
                      ),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      'Coding : ',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  coding(context: context, label: 'Dart', perc: 0.9),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  coding(context: context, label: 'Html', perc: 0.8),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  coding(context: context, label: 'Javascript', perc: 0.5),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      'Knowledge : ',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  knowledge(label: 'Git & Github'),
                  knowledge(label: 'Sqflite'),
                  knowledge(label: 'Getx'),
                ],
              ),
            ),
          )
        ],
      ),
    );

