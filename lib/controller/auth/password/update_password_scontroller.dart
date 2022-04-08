import 'package:care_navigation/controller/auth/auth_controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController{
  TextEditingController newpassword=TextEditingController();
  TextEditingController oldpassword=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
   var obscureOldPassword = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;
  final authController1 = Get.put(AuthController());
  final authController = Get.find<AuthController>();
  

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
bool validateAndSaveUser() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady()  {
    
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }





}