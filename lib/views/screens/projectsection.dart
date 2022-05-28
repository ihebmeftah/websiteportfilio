// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:websiteportfilio/models/models.dart';
import 'dart:js' as js;

import '../theme/theme.dart';

myProject({BuildContext? context}) => SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.3,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding),
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: secondaryColor,
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    demoprojects[index].title!.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 18),
                  ),
                  Text(
                    demoprojects[index].description!,
                    maxLines: 4,
                    style: const TextStyle(height: 1.5),
                  ),
                  TextButton(
                      onPressed: () {
                        js.context
                            .callMethod('open', [demoprojects[index].link!]);
                      },
                      child: const Text('Code Source ',
                          style: TextStyle(color: primaryColor, fontSize: 18)))
                ],
              ),
            );
          },
        ),
      ]),
    );