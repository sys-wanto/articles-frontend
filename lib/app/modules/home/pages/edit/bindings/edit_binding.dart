import 'package:get/get.dart';

import '../controllers/edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditController(), permanent: true);
    Get.lazyPut<EditController>(
      () => EditController(),
    );
  }
}
