import 'package:care_navigation/constants/app_assets.dart';
import 'package:care_navigation/controller/auth/register/register_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/widgets/password_validation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  Widget bodyData(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
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
                  child: Form(
                    key: _.formk,
                    child: Column(
                      children: [
                        Image.asset(AppImage.appicon)
                            .marginOnly(top: 40, bottom: 50),
                        const Text(
                          AppText.register,
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
                          AppText.registeraccount,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              letterSpacing: 0.4),
                        ).marginOnly(bottom: 40),
                        CommonTextFormField1(
                          _.username,
                          'Enter Username',
                          'Username',
                          false,
                          TextInputType.name,
                          const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          (value) {
                            return (_.username.text.length < 4)
                                ? 'Username must contains atleast 4 characters'
                                : null;
                          },
                          showSuffix: false,
                          changeObscureStatus: () {},
                        ).marginSymmetric(horizontal: 30),
                        const SizedBox(
                          height: 20,
                        ),
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
                                ? 'Please Enter Valid Email'
                                : null;
                          },
                        ).marginSymmetric(horizontal: 30),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonTextFormField1(
                          _.password,
                          'Enter Password',
                          'Password',
                          _.obscurePassword,
                          TextInputType.visiblePassword,
                          const Icon(
                            Icons.lock_outlined,
                            color: Colors.grey,
                          ),
                          (value) {
                            return PasswordValidationWidget
                                .validatePasswordOnPressed(value);
                          },
                          showSuffix: true,
                          changeObscureStatus: () {
                            _.changeObscurePassword();
                          },
                        ).marginSymmetric(horizontal: 30),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonTextFormField1(
                          _.confirmpassword,
                          'Enter Confirm Password',
                          'Confirm Password',
                          _.obscurePassword,
                          TextInputType.visiblePassword,
                          const Icon(
                            Icons.lock_outlined,
                            color: Colors.grey,
                          ),
                          (value) {
                            if (value.isEmpty) {
                              return 'Confirm Password Cannot Be Empty';
                            }
                            if (value != _.password.text) {
                              return ' Password Does Not Match';
                            }
                            return null;
                          },
                          showSuffix: true,
                          changeObscureStatus: () {
                            _.changeConfirmObscurePassword();
                          },
                        ).marginSymmetric(horizontal: 30),
                        const SizedBox(
                          height: 30,
                        ),
                        IntlPhoneField(
                          validator: ((value) {
                            return (_.phone.text.length < 10)
                                ? 'Phone Number cannot be empty'
                                : null;
                          }),
                          controller: _.phone,
                          decoration: InputDecoration(
                            fillColor: const Color(0xffF8F7FB),
                            filled: true,

                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),

                            hintText: "Enter Phone Number",
                            labelText: "Enter Phone Number",
                            //hintStyle: const TextStyle(color: Color(0xFF797a7a)),
                            labelStyle:
                                const TextStyle(color: Color(0xffD2D2D2)),
                            errorStyle: const TextStyle(color: Colors.red),

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 20),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD2D2D2),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffD2D2D2),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red),
                              gapPadding: 10,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red),
                              gapPadding: 10,
                            ),
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                        ).marginSymmetric(horizontal: 30),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                AppText.alreadyhaveccount,
                                style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Text(
                                  AppText.login,
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ).marginOnly(
                                  right:
                                      MediaQuery.of(context).size.width * 0.10)
                            ]).marginOnly(bottom: 30),
                        CircularButtons(
                            text: AppText.register,
                            width: 230,
                            height: 50,
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                            onPressed: () async {
                              if (_.validateUser()) {
                                await _.signupfunction();
                                // Get.back();
                              } else {
                                Get.snackbar(
                                    'Error', "Please add all requirements",
                                    colorText: Colors.white,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(bodyData: bodyData(context));
  }
}
