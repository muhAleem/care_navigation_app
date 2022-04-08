import 'dart:io';

import 'package:care_navigation/constants/app_colors.dart';
import 'package:care_navigation/controller/home/dashboard_controller.dart';
import 'package:care_navigation/controller/home/home_controller.dart';
import 'package:care_navigation/view/createfolder/create_folder_screen.dart';
import 'package:care_navigation/view/home/home_screen.dart';
import 'package:care_navigation/view/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (_.navigationQueue.isEmpty) {
              return showWillPopMessage(context);
            }
            _.navigationQueue.removeLast();
            int position =
                _.navigationQueue.isEmpty ? 0 : _.navigationQueue.last;
            _.currentindex = position;
            _.update();
            return false;
          },
          child: Scaffold(
            body: getBody(_),
            bottomNavigationBar: bottomnavbar(_),
          ),
        );
      },
    );
  }

  showWillPopMessage(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: const Text(
            'Exit App?',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              letterSpacing: 0.4,
              fontFamily: 'Roboto',
            ),
          ),
          content: Container(
            height: 100.0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure you want to exit App?',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 0.4,
                      fontFamily: 'Roboto'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      onPressed: () async {
                        Get.back();
                      },
                      child: const Text(
                        "CANCEL",
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      minWidth: Get.width / 3.5,
                      height: 48,
                      color: Color(0xff6F707E),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else {
                          exit(0);
                        }
                      },
                      child: const Text(
                        "EXIT",
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      minWidth: Get.width / 3.5,
                      height: 48,
                      color: AppColors.commonColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bottomnavbar(DashboardController _) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          label: 'Home',
          //backgroundColor: Color.fromRGBO(27, 29, 40, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.folder,
            size: 25.0,
          ),
          label: 'PDF',
          //backgroundColor: Color.fromRGBO(27, 29, 40, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
          //backgroundColor: Color.fromRGBO(27, 29, 40, 1),
        ),
      ],
      currentIndex: _.currentindex,
      selectedItemColor: AppColors.commonColor,
      selectedFontSize: 12.0,
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xffD3D3D3),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _.changeTabIndex,
    );
  }

  Widget getBody(DashboardController _) {
    List<Widget> pages = const [
      HomeScreen(),
      CreateFolderScreen(),
      Setting(),
    ];
    return IndexedStack(
      index: _.currentindex,
      children: pages,
    );
  }
}
