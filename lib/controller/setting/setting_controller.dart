import 'package:care_navigation/view/auth/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingController extends GetxController {
  bool isLoading = false;
  String pic = '';
  String firstName = '';
  String phone = '';
  String email = '';

  var obscureOldPassword = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;

  void changeOldPassword() {
    obscureOldPassword.value = !obscureOldPassword.value;
    update();
  }

  void changeNewPassword() {
    obscureNewPassword.value = !obscureNewPassword.value;
    update();
  }

  void changeConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
    update();
  }

  @override
  void onReady() async {
    await getDataFromFirebase();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> getDataFromFirebase() async {
    var userdata = await FirebaseFirestore.instance
        .collection('Users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (var element in userdata.docs) {
      email = element.get('email');
      firstName = element.get('username');

      pic = element.get('userpic').toString() == 'null'
          ? ''
          : element.get('userpic');
    }
    update();
    //  var document = await FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();
  }

  Future<void> logoutfun() async {
    await FirebaseAuth.instance.signOut().then((value) async {
      Get.offAll(() => const LoginScreen());
    });
  }
}
