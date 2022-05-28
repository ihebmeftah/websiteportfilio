import 'package:get/get.dart';
import 'package:websiteportfilio/services/themeservices.dart';

class Mycontroller extends GetxController {
  bool value = ThemeServices().isDark();
  changeSwitcher() {
    value = !value;
    update();
  }
}
