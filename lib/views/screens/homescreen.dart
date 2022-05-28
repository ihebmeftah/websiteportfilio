import 'package:flutter/material.dart';
import 'package:websiteportfilio/services/themeservices.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: const Icon(Icons.abc),
        ),
      ),
    ));
  }
}
