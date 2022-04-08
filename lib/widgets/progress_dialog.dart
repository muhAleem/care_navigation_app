import 'package:care_navigation/utils/app_libraries.dart';

import 'package:get/get_navigation/src/dialog/dialog_route.dart';

class AppProgressDialog {
  late GetDialogRoute<dynamic> route;

  void show({bool barrierDismissible = true}) {
    route = GetDialogRoute(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: AppColors.commonColor, size: 70),
            ),
          ),
        );
      },
      barrierDismissible: barrierDismissible,
    );
    Navigator.of(Get.context!).push(route);
  }

  void dismiss() {
    if (route != null && route.canPop) {
      Get.removeRoute(route);
    }
  }
}
