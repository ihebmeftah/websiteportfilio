import 'package:get/get.dart';

import '../views/screens/homescreen.dart';

class Approutes {
  //initialRoute
  static const home = Routes.home;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const Home(),
    ),
  ];
}

class Routes {
  static const home = '/home';
}
