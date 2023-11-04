import 'package:get/get_state_manager/get_state_manager.dart';

class Controller extends GetxController {
  int page = 0;

  pageUpdate(int index) {
    page = index;
    update();
  }
}
