import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/auth/password/forget_password_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(
        context,
      ),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      init: ForgetPasswordController(),
      builder: (_) {
        return _.isLoading
            ? Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColors.commonColor, size: 70),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Image.asset(AppImage.appicon)
                          .marginOnly(top: 60, bottom: 160),
                      const Text(
                        AppText.forgetpassword,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            letterSpacing: 0.7),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Form(
                        key: _.formkey,
                        child: CommonTextField(
                            controller: _.email,
                            hintText: 'Enter your email here',
                            isTextHidden: false,
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern as String);
                              return (!regex.hasMatch(value!))
                                  ? 'Please Enter Valid Email '
                                  : null;
                            }).marginSymmetric(horizontal: 30),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CircularButtons(
                          text: AppText.submit,
                          width: 230,
                          height: 50,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                          onPressed: () {
                            if (_.validateAndSave()) {
                              _.firebaseAuth.sendPasswordResetEmail(
                                email: _.email.text,
                              );
                              _.update();
                              Get.back();
                              Get.snackbar('Success',
                                  "The reset password link has been sent to your provided email",
                                  backgroundColor: Colors.green);
                            } else {
                              Get.snackbar(
                                  'Warning', "Please enter a valid email",
                                  backgroundColor: Colors.red);
                            }
                          },
                          backgroundColor: AppColors.commonColor,
                          textColor: AppColors.white,
                          borderColor: AppColors.commonColor)
                    ],
                  ),
                ),
              );
      },
    );
  }
}
