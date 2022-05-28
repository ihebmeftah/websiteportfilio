import 'package:flutter/material.dart';

info(BuildContext? context) {
  return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        color: const Color(0xFF242430),
        child: Column(children: [
          const Spacer(),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/pdp.jpg'),
          ),
          const Spacer(),
          Text(
            'Iheb Meftah',
            style: Theme.of(context!).textTheme.subtitle2,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '''
I'm student in Higher Institute of Computer Science and Multimedia of Sfax specializing in Data analysis, Big data and mobile development with Flutter.
''',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
          ),
          const Spacer(),
        ]),
      ));
}
