// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:websiteportfilio/models/models.dart';
import 'dart:js' as js;

import '../../responsive.dart';
import '../theme/theme.dart';

myProject({BuildContext? context}) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebook),
                onPressed: () {
                  js.context.callMethod(
                      'open', ["https://www.facebook.com/iheb.meftah.5/"]);
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram),
                onPressed: () {
                  js.context.callMethod(
                      'open', ["https://www.instagram.com/iheb_meftah/?hl=fr"]);
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  js.context.callMethod('open',
                      ["https://www.linkedin.com/in/iheb-meftah-7837411b9/"]);
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {
                  js.context.callMethod('open',
                      ["https://github.com/ihebmeftah?tab=repositories"]);
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isDesktop(context!) ? 3 : 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding),
        itemCount: demoprojects.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: secondaryColor,
            padding: EdgeInsets.all(
                Responsive.isDesktop(context) ? defaultPadding : 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  demoprojects[index].title!.toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: Responsive.isDesktop(context) ? 18 : 10),
                ),
                Text(
                  demoprojects[index].description!,
                  maxLines: 4,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: Responsive.isDesktop(context) ? 18 : 8),
                ),
                TextButton(
                    onPressed: () {
                      js.context
                          .callMethod('open', [demoprojects[index].link!]);
                    },
                    child: Text('Code Source ',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: Responsive.isDesktop(context) ? 18 : 8)))
              ],
            ),
          );
        },
      ),
    ]);
