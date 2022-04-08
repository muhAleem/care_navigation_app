import 'package:care_navigation/constants/app_assets.dart';

import 'package:care_navigation/controller/auth/login/login_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/auth/password/forget_password_screen.dart';
import 'package:care_navigation/view/auth/register/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Widget bodyData(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (_) {
          return _.isLoading
              ? Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                          color: AppColors.commonColor, size: 70),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(AppImage.appicon)
                          .marginOnly(top: 60, bottom: 60),
                      const Text(
                        AppText.login,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            letterSpacing: 0.4),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        AppText.loginaccount,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                            letterSpacing: 0.4),
                      ).marginOnly(bottom: 70),
                      CommonTextFormField1(
                        _.email,
                        'Enter Email',
                        'Email',
                        false,
                        TextInputType.emailAddress,
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          var regex = RegExp(pattern as String);
                          return (!regex.hasMatch(value!))
                              ? 'Please enter valid email'
                              : null;
                        },
                      ).marginSymmetric(horizontal: 30),
                      const SizedBox(
                        height: 11,
                      ),
                      CommonTextFormField1(
                        _.password,
                        'Enter password',
                        'Password',
                        _.obscurePassword,
                        TextInputType.name,
                        const Icon(
                          Icons.lock_outlined,
                          color: Colors.grey,
                        ),
                        (value) {
                          return (_.password.text.length < 8)
                              ? 'Password must contains atleast eight characters'
                              : null;
                        },
                        showSuffix: true,
                        changeObscureStatus: () {
                          _.changeObscurePassword();
                        },
                      ).marginSymmetric(horizontal: 30),
                      const SizedBox(
                        height: 48,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.08,
                            ),
                            Checkbox(
                              activeColor: const Color(0xff939393),
                              checkColor: Colors.white,
                              side: const BorderSide(
                                  color: Color(0xff939393),
                                  style: BorderStyle.solid),
                              value: _.rememberMe,
                              onChanged: (bool? value) {
                                _.rememberMe = value!;

                                _.update();
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(ForgetPassword());
                              },
                              child: const Text(
                                'Forget Password',
                                style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ).marginOnly(
                                right: MediaQuery.of(context).size.width * 0.10)
                          ]).marginOnly(bottom: 30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              AppText.createaccount,
                              style: TextStyle(
                                  color: Color(0xff808080),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const RegisterScreen());
                              },
                              child: const Text(
                                AppText.register,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ).marginOnly(
                                right: MediaQuery.of(context).size.width * 0.10)
                          ]).marginOnly(bottom: 48),
                      CircularButtons(
                          text: AppText.login,
                          width: 230,
                          height: 50,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                          onPressed: () {
                            if (_.email.text.isEmail &&
                                _.password.text.length > 7) {
                              _.loginUser();
                            } else {
                              Get.snackbar("Error", "Fill all fields",
                                  backgroundColor: Colors.red);
                            }
                          },
                          backgroundColor: AppColors.commonColor,
                          textColor: AppColors.white,
                          borderColor: AppColors.commonColor)
                    ],
                  ),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(bodyData: bodyData(context));
  }
}
