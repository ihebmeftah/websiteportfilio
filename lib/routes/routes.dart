import 'package:get/get.dart';

import '../loading.dart';
import '../views/screens/homepage.dart';

class Approutes {
  //initialRoute
  static const loading = Routes.loading;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.homepage,
      page: () => Homepage(),
    ),
    GetPage(
      name: Routes.loading,
      page: () => const Loading(),
    ),
  ];
}

class Routes {
  static const homepage = '/AboutSection';
  static const loading = '/loading';
}
