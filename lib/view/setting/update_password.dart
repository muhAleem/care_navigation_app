import 'package:care_navigation/constants/app_colors.dart';
import 'package:care_navigation/controller/auth/password/update_password_scontroller.dart';
import 'package:care_navigation/widgets/app_textfields.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  Widget bodyData(context) {
    return GetBuilder<UpdatePasswordController>(
        init: UpdatePasswordController(),
        builder: (_) {
          return Form(
            key: _.formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/app_logo.png"),
                      fit: BoxFit.fill,
                    )),
                  ).marginOnly(left: 41, right: 38, top: 43, bottom: 30),
                  const SizedBox(
                    child: Text(
                      "Update Password",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                  ).marginOnly(left: 67, right: 67, top: 12),
                  CommonTextField(
                    isTextHidden: false,
                    controller: _.oldpassword,
                    bordercolor: const Color(0xffD2D2D2),
                    fillcolor: const Color(0xffF8F7FB),
                    hintText: "Enter old password",
                    prefixIcon: Icons.lock,
                    validator: (value) {
                      return (_.oldpassword.text.length == 0)
                          ? 'oldPasswordCanNotBeEmpty'
                          : null;
                    },
                    changeObscureStatus: () {
                      _.changeOldPassword();
                    },
                  ).marginOnly(top: 40, right: 25, left: 25),
                  CommonTextField(
                    isTextHidden: false,
                    controller: _.newpassword,
                    bordercolor: const Color(0xffD2D2D2),
                    fillcolor: const Color(0xffF8F7FB),
                    hintText: "Enter new password",
                    prefixIcon: Icons.lock,
                    validator: (value) {
                      return (_.newpassword.text.length < 8)
                          ? 'Password length must be at least 8 characters'
                          : null;
                    },
                    changeObscureStatus: () {
                      _.changeNewPassword();
                    },
                  ).marginOnly(top: 40, right: 25, left: 25),
                  CommonTextField(
                    controller: _.confirmPassword,
                    bordercolor: const Color(0xffD2D2D2),
                    fillcolor: const Color(0xffF8F7FB),
                    hintText: "Confirm new password",
                    prefixIcon: Icons.lock,
                    isTextHidden: false,
                    validator: (value) {
                      if (_.confirmPassword.text.length < 8) {
                        return 'Password length must be at least 8 characters';
                      }
                      if (_.confirmPassword.text != _.newpassword.text) {
                        return 'Password not match';
                      }
                      return null;
                    },
                    changeObscureStatus: () {
                      _.changeNewPassword();
                    },
                  ).marginOnly(top: 40, right: 25, left: 25),
                  MaterialButton(
                    onPressed: () async {
                      if (_.oldpassword.text == '' ||
                          _.newpassword.text == '' ||
                          _.confirmPassword.text == '') {
                        Get.snackbar('Error', "Please fill all fields");
                      } else if (_.newpassword.text == _.confirmPassword.text &&
                          _.validateAndSaveUser() == true) {
                        _.authController.changePassword(
                            _.oldpassword.text, _.newpassword.text);
                        // _.formkey.currentState!.reset();
                      } else {
                        Get.snackbar("Error", "Password does not match");
                      }
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    elevation: 5.0,
                    minWidth: 230,
                    height: 55,
                    color: AppColors.commonColor,
                    child: const Text('SAVE',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ).marginOnly(top: 85, right: 52, left: 52, bottom: 52),
                ],
              ),
            ),
          );
        });
  }
}
