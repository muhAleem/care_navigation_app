import 'dart:convert';

import 'package:care_navigation/controller/setting/setting_controller.dart';
import 'package:care_navigation/utils/app_libraries.dart';
import 'package:care_navigation/view/auth/login/login_screen.dart';
import 'package:care_navigation/view/setting/profile.dart';
import 'package:care_navigation/view/setting/update_password.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      appbarcolor: AppColors.white,
      automaticallyImplyLeading: true,
      appbarTitle: '',
      bodyData: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
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
              : ListView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                  children: [
                      const Text(
                        "General setting",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 60.0,
                          backgroundImage:
                              _.pic.isEmpty ? null : NetworkImage(_.pic),
                          child: _.pic.isEmpty
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.person,
                                      color: Colors.black))
                              : null),
                      Text(
                        // ignore: unnecessary_string_interpolations
                        '${_.firstName}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ).paddingOnly(bottom: 30, top: 20),
                      const Divider(
                        height: 5,
                      ),
                      ListTile(
                        title: const Text('Edit Profile'),
                        onTap: () {
                          Get.to(const UpdateInformationScreen());
                        },
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(Icons.account_circle_outlined,
                              size: 20, color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 20,
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      ListTile(
                        title: const Text('Update Password'),
                        onTap: () {
                          Get.to(const UpdatePasswordScreen());
                        },
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(Icons.lock,
                              size: 20, color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 20,
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      ListTile(
                        title: const Text('Log Out'),
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(Icons.logout,
                              size: 20, color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: 20,
                        ),
                        onTap: () {
                          Get.off(const LoginScreen());
                          Get.snackbar("Success", "Logout Successfully");
                        },
                      ),
                      const Divider(
                        height: 5,
                      ),
                    ]);
        });
  }
}
