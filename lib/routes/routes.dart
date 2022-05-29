import 'package:get/get.dart';

import '../views/screens/homepage.dart';

class Approutes {
  //initialRoute
  static const homepage= Routes.homepage;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.homepage,
      page: () =>  Homepage(),
    ),
  ];
}

class Routes {
  static const homepage = '/AboutSection';
}
